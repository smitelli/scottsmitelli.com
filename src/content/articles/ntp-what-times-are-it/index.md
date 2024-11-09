+++
title = 'The Network Time Protocol: What Times Are It?'
description = 'An exploration of the Network Time Protocol (NTP) message format, the interpretation of each of its data fields, and the underlying variables that time servers track to keep their clocks accurate.'
date = 2024-08-02
+++

{{% epigraph %}}
> A man with a watch knows what time it is. A man with two watches is never sure.
> <footer>{{% link wiki-segals-law /%}}</footer>
{{% /epigraph %}}

When I was a kid, my dad used to go through the house after every power outage or daylight saving time change and reset all of the clocks. Between the appliances, in-wall light timers, and regular desk clocks it all added up to a time-consuming task that took up half an evening. He always managed to get them close to each other, and the outside lights would come on every night in a uniform flourish. In those days he would get the time from the on-screen overlay broadcast on The Weather Channel, set his wristwatch to that, then set all the other clocks to the watch.

We don't really do that anymore. (Well, _he_ still does, but _we_ don't.) Things these days seem to be a lot better about figuring out the time on their own. Pick up any internet-connected device you may have nearby, and there is a fairly high probability that it contains a **Network Time Protocol (NTP)** implementation somewhere within it. NTP's job could be described simply as "make the clock in here say the same thing as the clock out there," but the specifics can be daunting to anybody looking at it for the very first time. That's kind of a shame, because the actual protocol that underpins NTP operations is quite elegant.

This article avoids getting into the details of the NTP software, clock discipline and step/slew, nor does it wander off into tangential areas like outlier rejection and "falseticker"/"truechimer" identification. These are all higher-level corrections that the NTP software performs based on long-term statistical analysis of many NTP network messages from disparate sources. Our focus here is one message from one source---for a lot of use cases that's plenty good enough.

## Just enough UDP to be dangerous

Conventional NTP communications involve a **client** (the program that wants to know what time it is) and a **server** (the program that knows the time). In practice these programs are on two different computers that can communicate over a network. This network may be wired or wireless, within a single home/office environment or separated by miles, but for best accuracy the round-trip time from client to server and back should be as quick as possible.

NTP messages are contained in **User Datagram Protocol (UDP)** frames which are then encapsulated within **Internet Protocol (IP)** packets. This protocol turducken permits the NTP software to delegate most of the complexity of network communication to the underlying operating system. UDP is simple and fast (always a good thing when trying to minimize round-trip time) but it has a trade-off: There is no guarantee that UDP messages will arrive at their destination, or in what order they might be processed. If a UDP message doesn't get where it's supposed to be going, there is no error indication and no automatic recovery.

In order to initiate an NTP message exchange, the client must already know the IP address of a computer running the NTP server software and the UDP port number that this server is listening on. The IP address is either already known through static configuration by an administrator, it could've snuck in through DHCP, or it may have come from a DNS lookup from a name like `pool.ntp.org` or `time.windows.com`. The UDP port number is **123** by convention, and all well-configured NTP servers will be listening there.

The client constructs its NTP request message and instructs the operating system to send it to the server's IP:port pair. As the operating system prepares the message for transit, the client's IP:port pair are encoded in the packet in a sort of "reply-to" field. Once the server receives this message, it uses a similar mechanism to send a response message back to the client's reply-to address. The client is listening to the same port it sent its original request from, and that's where the server's response arrives... Eventually. Hopefully. With one NTP request sent and one response received, the client has everything it needs to start correcting its own clock.

There's a detail in this exchange of messages that's not immediately obvious: Aside from keeping the UDP port open to receive the server's response, there is technically no need to maintain any local state about the in-flight request. Everything the client needs to know in order to make sense of a server response is contained within that response itself.

## What we talk about when we talk about timestamps

Ask a typical person the current date, and they'll likely respond with some combination of a month name, day of the month, and maybe a four-digit year if they're a completionist. The thing is, this way of expressing the date involves _a lot_ of complexity. Different months have different numbers of days, the length of February depends on the leap year, the leap year has fiddly rules, {{% margin-note %}}1900 was not a leap year, but 2000 was...{{% /margin-note %}} and so on. The time of day is comparatively easier as long as you disregard time zones, daylight saving time, and leap seconds.{{% margin-note side %}}Or leap smear, if that's your thing{{% /margin-note %}}

Instead of storing time in a human-centric format, computers simply count seconds. Every time their internal timer ticks off one second, a counter is incremented. The value of the counter at any instant reflects the number of seconds that have occurred since the time system's **epoch**, which is the date and time that a count of "zero" represents. {{% margin-note %}}Another way to frame this is to think of the epoch as the moment of the time system's birth. At any point in time, the timestamp represents the age of the time system in seconds.{{% /margin-note %}} All computers that use the same timestamp format must agree to use the same epoch date.

Operating systems that descend from Unix conventionally use an epoch of **January 1, 1970 at midnight UTC**, maintaining a count of seconds from this point in time. When this paragraph was written{{% margin-note side %}}August 2024{{% /margin-note %}} the Unix timestamp was approximately 1,722,000,000 seconds.

Depending on the requirements of the time system, it's perfectly acceptable to have a negative timestamp value that represents a moment that occurred prior to the epoch. For example, December 3, 1965{{% margin-note side %}}The release date of _Rubber Soul_ by The Beatles{{% /margin-note %}} can be expressed as -128,674,800 even though it precedes the Unix epoch by four years.

This scheme of second-counting makes it trivial to determine how to sort events chronologically, or add/subtract time intervals to an arbitrary date. Converting a timestamp to and from human form still involves complexity, however. Luckily most computers only do that sometimes.

## But wait, there's less

A day after the Unix counter started, the timestamp was 86,400 seconds (requiring five decimal digits). After a week it was 604,800 (six digits). Today it takes ten digits to express. As time passes, the number of digits required to store the timestamp grows logarithmically. {{% margin-note %}}That's sorta the whole definition of a logarithm.{{% /margin-note %}}

Computers don't use decimal numbers internally; everything is tracked in binary using **bits** that are set to either zero or one. The equivalent first-day timestamp was 1 0101 0001 1000 0000 (17 bits), the one-week timestamp was 1001 0011 1010 1000 0000 (20 bits), and today's timestamp is 31 bits that I am not going to bother pasting here.

Every computer has an intrinsic data size that it is designed to work best with (which is why you'll hear classic computers described as "8-bit" or "16-bit" systems; this is their native data size). If a piece of data doesn't fit into the machine's preferred data size, the next-best option is to store the data in some even multiple of that size and work on the calculation in pieces. It is because of these factors that a bunch of things historically ended up being **32 bits** wide. If you're wondering about the largest expressible 32-bit number, it's {{% math %}} 2^{32} - 1 = 4,294,967,295 {{% /math %}}. Interpreted as a Unix timestamp, this value is the early morning on February 7, 2106. One second later, the timestamp will **overflow** and return back to zero, {{% margin-note %}}Imagine you were doing a math problem on paper: 99 plus 1. Nine plus one is zero, carry the one. Nine plus one is zero, carry the one again. 100. But in this case there is no space for that leading one in the answer; it just falls away quietly.{{% /margin-note %}} reverting the clock back to 1970.

But remember when we said that negative timestamps are permitted? One of those 32 bits is reserved, used as a **sign flag** that indicates whether the number is negative or positive. Our range is actually more like {{% math %}} \pm 2^{31} - 1 = \pm 2,147,483,647 {{% /math %}}. The timestamp range here is December 13, 1901 to January 19, 2038. Once Y2K38 comes, systems that use _signed_ 32-bit timestamps will think it's 1901 again. {{% margin-note %}}Better dust off those knickerbockers and corsets.{{% /margin-note %}}

The solution, obviously, is to use 64-bit timestamps. By simply doubling the storage size of the timestamp, our timers could tick for hundreds of billions of years without overflowing. In this day and age of staggering storage and bandwidth capacities, only some kind of wiener would use 32 bits for a timestamp.

## NTP's 32-bit timestamp format

NTP timestamps are positive values that count the number of seconds since the NTP **prime epoch**, which was **midnight UTC on January 1, 1900**. Timestamps are actually 64-bit fixed-width numbers consisting of an unsigned 32-bit seconds field next to an unsigned 32-bit fraction field. As with Unix timestamps, this allows for a range of {{% math %}} 2^{32} - 1 = 4,294,967,295 {{% /math %}} seconds with a fractional precision of {{% math %}} 1 \over 4,294,967,296 {{% /math %}} (or {{% math %}} 2.33\times10^{-10} {{% /math %}}) seconds.{{% margin-note side %}}That's how long it takes light to travel about three inches.{{% /margin-note %}}

These 64-bit timestamps can be decoded by splitting them into two 32-bit parts, treating the first part as an integer component and the other as the numerator in the expression {{% math %}} n \over 2^{32} {{% /math %}}. It's also possible to get the correct answer by treating the entire timestamp as an unsigned 64-bit integer and then dividing by {{% math %}} 2^{32} {{% /math %}} to produce a floating-point number of seconds.

The choice of 1900 for the prime epoch is _possibly_ a remnant of {{% link rfc868 /%}}, the "Time Protocol" from 1983. This two-page(!) document describes a TCP/UDP service that receives no fields from the client, and responds with a 32-bit integer timestamp relative to January 1, 1900. {{% margin-note %}}This is somewhat better than its twin sibling "{{% link rfc867 %}}Daytime Protocol{{% /link %}}," which defines "no specific syntax" that the reply should use.{{% /margin-note %}}

NTP's maintainers at least acknowledge that timestamp overflow can happen, and created terminology to describe it. The NTP timestamp actually represents a moment in time relative to an **era**, which is a span of about 136 years. We are currently in NTP era zero, which covers dates from the prime epoch of January 1, 1900 to February 7, 2036. Instead of overflowing back to 1900 when the timestamp rolls over, we're supposed to step into era one and remain in the year 2036. This is all well and good, except that the NTP message format does not encode the era number anywhere---it only exists in the internal data structures of the NTP software.{{% margin-note side %}}See {{% link ntp-timescale-and-data-formats %}}this page{{% /link %}}, specifically the difference between the terms "timestamp" and "datestamp."{{% /margin-note %}}

So here we are, exchanging messages that can conceivably give us sub-nanosecond precision, but with no absolute way of indicating which century we're in. The NTP software operates under the assumption that the client has some kind of onboard clock that is---at least in the most generous sense--set correctly. In its model, the client and server clocks are trusted to already be accurate to within half an era (so, less than 68 years away from each other). Under those conditions, regular math works correctly and the internal era number can be determined by doing comparisons between two timestamps without explicitly exchanging any era information.

If a na&iuml;ve client boots up with complete chronological amnesia and no sense of what year it is, there's a problem. It cannot know for sure what NTP era the server is calculating its timestamps relative to, and might make an absurdly bad guess. To mitigate this issue, software deployed in these kinds of environments should contain a built-in "earliest reasonable" timestamp that absolutely, positively already occurred. It could be a compile date, a firmware date code, one of the developers' dates of birth, or some other moment that definitely happened in the past and can never happen again. If an NTP server presents a timestamp that occurs before that date, the era number is definitely too low and the next era should be tried. Of course, if a _second_ NTP era has passed since the software was built, we're still going to get the wrong answer doing this.

Still, with just a small piece of guard code, we can kick the problem from February 7, 2036{{% margin-note side %}}A date by which I plan to be thoroughly retired from the tech industry{{% /margin-note %}} to March 15, 2172{{% margin-note side %}}A date by which I plan to be thoroughly dead{{% /margin-note %}}.

{{% box %}}**Note:** There is an alternative algorithm proposed by {{% link rfc4330 /%}} that involves checking the most significant bit in the response timestamp. If it is set, use 1900 as the epoch as usual. If it is clear, use 2036 as the epoch. This permits timestamps from 1968 to 2104 to be handled.{{% /box %}}

Timestamps are central to the structure of NTP messages, but the difference obtained by _subtracting_ one timestamp from another is also significant to the broader operation of the algorithm. As you will soon see, the real elegance of NTP's algorithm comes from operations done on multiple timestamp values.

## Differing opinions of now

So, the client has a clock which is assumed to be functioning correctly, but the absolute time that it reports is assumed to be wrong (but less than a half-era off from the true time). NTP's goal is to compare the client time to a server's time, and determine the difference between the two. This difference can then be added/subtracted to the client's clock, and the two machines will be synchronized.

When the client constructs its initial NTP message, it puts its own (wrong) time into a field that is eventually known as the **origin timestamp**. Time waits for nothing, however, so the message needs to be sent out as soon as possible after filling this field. The server's response preserves this origin timestamp, allowing the client to see what time it thought it was when the original request was made.

The server populates two additional timestamp fields called the **receive timestamp** and the **transmit timestamp**. The receive timestamp is filled with the server's time at the instant the request was received, and the transmit timestamp gets the time at the instant the response is sent. In practice these times are very, very close to each other because the server doesn't have to do all that much work to respond to a request.

As soon as the response arrives back at the client, it again takes note of its own (wrong) time at that moment. This will be called the **destination timestamp**. Using these four timestamps, the client can compute an **offset**, or the difference between its clock and that of the server, using the following formula:

{{< math true >}}
\mathrm{Offset} = {{
    (T_\mathrm{receive} - T_\mathrm{origin}) + (T_\mathrm{transmit} - T_\mathrm{destination})
} \over 2}
{{< /math >}}

Where:
- {{% math %}} T_\mathrm{origin} {{% /math %}}: client timestamp when the request was sent
- {{% math %}} T_\mathrm{receive} {{% /math %}}: server timestamp when the request was received
- {{% math %}} T_\mathrm{transmit} {{% /math %}}: server timestamp when the response was sent
- {{% math %}} T_\mathrm{destination} {{% /math %}}: client timestamp when the response was received

A _positive_ offset indicates that the server's timestamp is _greater_ than the client's. The client clock is slow and must have this offset _added_ to make its clock accurate.

Even if the two clocks are already synchronized perfectly, it takes time for the message to travel from the client to the server and back. This round-trip **delay** value represents the amount of time the message spent traveling over the network, and can be computed using this formula:

{{< math true >}}
\mathrm{Delay} = (T_\mathrm{destination} - T_\mathrm{origin}) - (T_\mathrm{transmit} - T_\mathrm{receive})
{{< /math >}}

The timestamp definitions are the same as before. This delay value is akin to the round-trip **ping** time between the client and server, and conveys the worst-case uncertainty in the computed offset value. In other words, if an NTP exchange indicates a total delay of one second, the computed offset value represents the midpoint of a one-second window, and the true offset falls somewhere within that window. The more symmetrical the send/receive delays are, the more accurate the offset calculation becomes.

To visualize offset and delay:

{{% figure caption="Diagram of a plausible client-server exchange. The delay is {{% math %}} (141 - 100) - (325 - 321) = 37 {{% /math %}} ms. The offset is {{% math %}} [(321 - 100) + (325 - 141)] / 2 = 202.5 {{% /math %}} ms, indicating that the client clock is slow by about 200 ms. The 2.5 ms of error is a consequence of the asymmetry of the delays (it took longer to send the request than it did to receive the response)." %}}
{{% picture stem=diagram class=invertible %}}
{{% /figure %}}

The gap between the receive and transmit timestamps does not contribute to the delays or offset uncertainty. The server can take as much processing time as it reasonably needs without affecting accuracy. Similarly, an extremely slow network with perfectly symmetrical delays can produce a very good offset value, but the client can't know how good that offset actually is with the information it gets from a single exchange.

## Give me four numbers, I'll give you two

I suppose we could just accept the offset and delay equations as gospel and move on with our lives. Or we could pry. Let's pry.

NTP's main adversary is network delay. The more time that passes during a message exchange, the less certain the algorithm can be about how different the client and server clocks are. The client knows trivially how much time passed from the instant it sent its request to when the response came back: {{% math %}} T_\mathrm{destination} - T_\mathrm{origin} {{% /math %}} encompasses all the network delay encountered in both directions.

The server, however, knows things that the client doesn't: The arrival time of the request _and_ the departure time of the response are both available, and the time spent between these two timestamps is _not_ part of network delay. Therefore, the interval {{% math %}} T_\mathrm{transmit} - T_\mathrm{receive} {{% /math %}} can be subtracted from the delay value the client has computed. It does not matter here that the two clocks are unsynchronized; the difference between two timestamps is a relative measurement.

Delay therefore only covers _the time spent actually moving messages over the network._

For offset, there is a bit more blind faith involved. The first subexpression, {{% math %}} T_\mathrm{receive} - T_\mathrm{origin} {{% /math %}}, essentially calculates the client/server offset combined with the network delay on the request side. By itself, there is not enough information to determine how much of the difference is caused by clock offset and how much is network delay.

The second subexpression, {{% math %}} T_\mathrm{transmit} - T_\mathrm{destination} {{% /math %}}, performs a similar calculation for the response side. Note that in both subexpressions, the server timestamp is the minuend and the client timestamp is the subtrahend. {{% margin-note %}}If my second grade teacher happens to be reading this: Hello! I think this is the first time I've used "minuend" and "subtrahend" in the thirty years since you taught them to me.{{% /margin-note %}} Both sides will produce negative results whenever the client clock is ahead of the server clock, and both will produce positive results otherwise.

It's important to notice, however, that the _temporal_ ordering of the two subexpressions is mirrored: The request timestamps are in "arrive minus leave" order while the response timestamps are "leave minus arrive." This ends up calculating _positive_ delay on the request side, and _negative_ delay on the response side! {{% margin-note %}}Of all the things I learned while reading about this topic, this was the part that blew my mind once I finally grasped it.{{% /margin-note %}} By adding everything from the two sides together, the offset doubles and the delays---effectively---cancel each other out. Halving the result gives us back our offset, or at least a quite good approximation of it.

This delay-canceling effect works perfectly only when the delays on each path are equal. The more they differ from each other, the more the offset is "pulled" away from the truth.

## Keep it SNTP, stupid

It's technically possible, although not always wise, to forgo the generation of origin/destination timestamps and just use the transmit timestamp from the server to get a "close enough" idea of the current time without correcting for network delay. This is what a **Simple Network Time Protocol (SNTP)** client does. In this model, the client makes one request and immediately snaps its internal clock to the response timestamp, repeating or skipping over as many seconds as the correction requires. This is acceptable for things like the initial power-on sequence of a smart thermostat or the home screen clock on your TV.

SNTP and NTP are identical protocols over the wire, and an SNTP client can acquire the time from a full-fledged NTP server without trouble. (An NTP client could be coaxed into synchronizing to an SNTP server as well, but with no guarantees about the fine accuracy.) SNTP is so simple that one can construct a client with only a small amount of code. And here's the proof:

{{% figure caption="Extremely tiny SNTP client written in Python. I suppose you could do the same with something like Bash + netcat if you were a masochist." %}}

```python
from datetime import datetime, timedelta, timezone
from socket import SOCK_DGRAM, socket
from struct import pack, unpack

PRIME_EPOCH = datetime(1900, 1, 1, tzinfo=timezone.utc)

client = socket(type=SOCK_DGRAM)
request = pack('!B47x', 0x23)
client.sendto(request, ('pool.ntp.org', 123))
response = client.recv(64)
(t_transmit, ) = unpack('!40xQ', response)
print(PRIME_EPOCH + timedelta(seconds=t_transmit / (2 ** 32)))
```
{{% /figure %}}

This code finds an (IPv4) NTP server from the {{% link ntp-pool-project /%}}, fires off the smallest technically-valid NTP version 4 request possible, and extracts only the server's transmit timestamp from the response. This is combined with the prime epoch (blindly assuming we're in NTP era zero), then printed. Aside from some shenanigans with struct packing and unpacking, this should be pretty straightforward to folks who have worked with dates and sockets in Python.

This code makes no effort to transmit the client's origin timestamp, and the server doesn't mind. As a consequence of this, however, this client can't determine how precise the returned timestamp is or how to correlate it with its own clock. All it knows is that, sometime between the time the request was sent and when the response arrived, the time at the server was the value shown. That's Pretty Good&trade; for our use case.

Those structs, though. There are more weeds to get into.

## Anatomy of an NTP message

Let's just jump right into it. Standard NTP messages are 48 bytes long. Both requests and responses have the same fields at the same offsets.

```goat
                     1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|LI | VN  |Mode |    Stratum    |     Poll      |   Precision   |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                          Root Delay                           |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                        Root Dispersion                        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                     Reference Identifier                      |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
|                 Reference Timestamp (64 bits)                 |
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
|                 Originate Timestamp (64 bits)                 |
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
|                  Receive Timestamp (64 bits)                  |
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
|                 Transmit Timestamp (64 bits)                  |
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

{{% box %}}**Note:** Some client/server implementations add extension fields and authentication keys to the end of the message, but this is not necessary for regular communication with a public server.{{% /box %}}

"LI" is the **leap indicator**, which is a response flag that advises the client of an impending leap second adjustment at the end of the current day. Usually this is zero, indicating no leap second will occur. An LI of 1 means that the final minute of the current day will have 61 seconds, and an LI of 2 means that the final minute of the current day will have 59 seconds. LI 3 is a special alarm flag that indicates that the server clock is unsynchronized and should not be trusted. LI is meaningless in client request messages and is ignored.

"VN" is the **version number**, and should be 4 for messages formatted to the NTPv4 specifications. The request has a version number that dictates how it should be interpreted, and the server's response will ideally use the same version number.

"Mode" is the **protocol mode**, which indicates the meaning of the message and how it should be interpreted. There are a few different operating modes that support broadcast and peer-to-peer modes, but for the purposes of this article we are only interested in Mode 3 (a request from a client) and Mode 4 (a response from the server).

LI, VN, and Mode are packed into a single byte on the wire. In our example client above, the magic number 0x23 in the request payload encodes Mode=3, VN=4, and LI=0.

"**Stratum**" is a measurement of how far removed a server is from the **root clock**, or the original source of true time. For a server connected directly to a high-precision atomic clock or some other preposterously expensive timekeeping apparatus, the Stratum value is 1. This is the purest, most accurate kind of NTP server one can encounter. When some other system synchronizes its clock to this Stratum 1 server, that system becomes a Stratum 2 server---it is one step removed from the source of time. Yet another system may synchronize itself to the Stratum 2 server, becoming a Stratum 3 server, and so on down the line. It's possible to get up to Stratum 15, although timekeeping precision at that point becomes a little questionable. This field is ignored in client requests.

"Poll" is the **poll interval**, expressed as seconds in {{% math %}} 2^n {{% /math %}} form. This is the server's recommendation on the maximum amount of time an SNTP client should wait between successive polls. {{% margin-note %}}As an example, if a server sends the value 6, the client interprets this as {{% math %}} 2^6 = 64 {{% /math %}} seconds, meaning this server should be re-polled about once a minute until advised otherwise.{{% /margin-note %}} This field is ignored in client requests, and is not meaningful for full-fledged NTP clients which make their own decisions about how often to poll the servers.

"**Precision**" represents the server's clock precision, expressed as seconds in {{% math %}} 2^n {{% /math %}} form. This field is a signed number and should be negative for any clock capable of sub-second granularity. {{% margin-note %}}As an example, if a server sends the value -8, the client interprets this as {{% math %}} 2^{-8} = 0.00390625 {{% /math %}} seconds, meaning that the smallest time difference this system's clock is able to resolve is about 4 ms. (Its clock objectively sucks.){{% /margin-note %}} This enables the client to determine how many bits of each timestamp's fractional fields have significance. This field is ignored in client requests.

"Root Delay" is the **total round-trip delay** to the Stratum 1 root clock, in seconds. This is the cumulative count of all delays through all the intermediate strata between this server and the root clock. This field is ignored in client requests.

"Root Dispersion" is the calculated **maximum clock error** relative to the Stratum 1 server clock, in seconds. Like Root Delay, this considers the cumulative effect of all intermediate servers all the way up to the root clock. The dispersion is determined by tracking the tiny relative errors between successive synchronization attempts, and it represents how accurate this server thinks its own clock is. This field is ignored in client requests.

Both the Root Delay and Root Dispersion fields are so-called NTP **short format** fields. These are 32-bit values consisting of a signed 16-bit seconds field and an unsigned 16-bit fractional field. They work similarly to the 64-bit timestamps, but can only cover a span of a few hours with a reduced granularity of about 15 microseconds. When communicating with a Stratum 1 server, it's sensible for both Root Dispersion and Root Delay to be zero.

The "**Reference Identifier**" and "**Reference Timestamp**" together provide a sense of where the server got its time from, and when that most recently occurred. The Reference Identifier can hold, depending on the situation, the four octets of an IPv4 address, or the first four bytes of the MD5 hash of an IPv6 address, or a four-character ASCII text code indicating a type of clock hardware. The Reference Timestamp represents the last time the server's clock was synchronized with this source. Both of these fields are ignored in client requests.

For responses from a Stratum 1 server, the Reference Identifier might look something like `GNSS` to indicate that the reference clock is one of the Global Navigation Satellite Systems, `CESM` for a cesium clock, or `WWVB` to refer to the WWVB radio broadcasts originating from the NIST facility in Colorado. The IP addresses returned by Stratum 2 (and beyond) servers will look like a more random string of bytes, representing the IP address of the next-higher stratum server it gets its time from. {{% margin-note %}}How do you differentiate the IPv4 bytes from hashed-IPv6 bytes? That's the neat part---you don't!{{% /margin-note %}} It's possible, in principle, to keep track of Reference Identifier values and detect unusual loops where servers are synchronizing to each other cyclically.

The "**Originate**," "**Receive**," and "**Transmit Timestamp**" fields are all 64-bit values which use the formats and interpretations that were described earlier in this article. The one tricky bit about this is that both the client and the server use the Transmit Timestamp field to record the time when a message was sent. The server _copies_ the Transmit Timestamp field into Originate Timestamp, then write its own value into Transmit Timestamp:

{{% fullwidth %}}
Field               | Request Message  | Response Message
:-------------------|:-----------------|:----------------
Originate Timestamp | (meaningless)    | client's TX time, copied from Transmit Timestamp
Receive Timestamp   | (meaningless)    | server's RX time
Transmit Timestamp  | client's TX time | server's TX time
{{% /fullwidth %}}

Because nobody else seems to do it this way, this is a packet diagram of a client request, substituting padding for each of the fields that the server doesn't care about: {{% margin-note %}}The stated reason for all the empty gaps in the request is to allow the server to read the request into a memory buffer, modify it in place, and then send the reply from that same buffer without needing to allocate any additional space.{{% /margin-note %}}

```goat
                     1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
| - | VN  |Mode |                 (3 pad bytes)                 |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
|                        (36 pad bytes)                         |
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                                                               |
|                 Transmit Timestamp (64 bits)                  |
|                                                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

The struct packing format `!B47x` in our demo client above demonstrates these 39 padding bytes, fused with 8 timestamp bytes that we didn't bother filling in, producing a string of 47 "don't care" bytes after the VN/Mode flag byte.

## Kiss off!

NTP defines a special class of server response messages called **Kiss-o'-Death (KoD)** messages. Broadly, this class of response is an in-band signal that instructs the client to stop doing whatever it's doing. When a server responds to an NTP request with a Stratum value of zero, the message is a kiss-o'-death and the interpretation of the Reference Identifier changes; it instead becomes a Kiss Code. A client can use this code value to determine what it did wrong. _Some_ of the values are:

{{% fullwidth %}}
Kiss Code | Meaning
:---------|:-------
`AUTH`    | Server authentication failed.
`DENY`    | Access denied by remote server.
`RSTR`    | Access denied due to local policy.
`INIT`    | The association has not yet synchronized for the first time.
`RATE`    | Rate exceeded. The server has temporarily denied access because the client exceeded the rate threshold.
`STEP`    | A step change in system time has occurred, but the association has not yet resynchronized.
{{% /fullwidth %}}

Most clients, upon receiving a KoD message, simply stop sending to that particular server and find a different one to bother. In environments with only one server available, an exponential backoff is usually employed to give the server some time to recombobulate itself.

## Staying sane

A robust client will perform a few sanity checks on a server response before blindly trusting the timestamp value it provides:

- The source IP address and UDP port number in the response packet's framing should belong to the server that was being queried.
- The LI value should not be 3. If it is, the server is indicating that it doesn't really know what time it is right now.
- The Mode value should make sense relative to the original request. For example, a client-server request mode of "3" should be answered with a mode of "4" to make sense.
- The Stratum value should not be zero, nor should it be higher than 15. Zero indicates a kiss-o'-death message, and it's anybody's guess what a stratum &ge;16 is supposed to mean.
- The Transmit Timestamp should not be zero, even though _technically_ there is an instant at the very start of each NTP era where such a timestamp would actually be correct.
- _If_ the client chose to keep a copy of its original Transmit Timestamp at the time the request was made, this should be identical to the Originate Timestamp in the server's response.
- The client may wish to set some internal upper bound for both Root Delay and Root Dispersion, above which the server clock will be considered too inaccurate to trust. {{% link rfc4330-client-operations %}}RFC 4330{{% /link %}} suggests a limit of one second for this.

## Now it's time for "so long"

For all the apparent complexity in the NTP tooling (I'm looking at you, `ntpq`) the underlying protocol is surprisingly straightforward. The timestamp format has been used in real-world applications---without modification---since NTP's first release in 1985 while the message format pretty much stabilized with NTPv2 in 1989. NTP's creator---David L. Mills (who passed away earlier this year)---should be celebrated for designing a network protocol that has been able to survive for nearly forty years and counting. In terms of internet technology, that is damn near an eternity. From expensive datacenters to tiny consumer toys, NTP keeps a billion computers marching in lockstep to one common beat. It's so easy sometimes to lose sight of how amazing that really is.

Now go hug the nearest piece of NTP infrastructure you can find. It might be closer than you think.
