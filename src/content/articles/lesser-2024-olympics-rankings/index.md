+++
title = 'The Lesser 2024 Olympics Rankings'
description = 'Depending on how you interpret the numbers, you can make any country come out on top.'
date = 2024-08-14
+++

It has long bothered me that the overall rankings at the Olympic Games simply take each country's total medal count as the single metric of success. Across all media outlets, whoever won the most medals overall is on top, and everybody else falls in line below. The main exception occurs when a country is doing extremely well, then a particular focus is paid to the number of _gold_ medals won instead. By changing what is measured, the rankings start to change pretty significantly.

The **2024 Summer Olympic Games** in Paris saw participation from 206 countries which collectively sent 10,795 competitors{{% margin-note side %}}How did I get such a specific number? Oh, _just you wait._{{% /margin-note %}} for an average of about 52 athletes per country. But averages are just averages: The United States and France each sent over ten times that amount, while 22 other countries _combined_ sent that many.

This disparity started to bug me, and it got me wondering how different the rankings would look if the medal counts were normalized against the number of people that participated. Did the fact that the U.S. sent a veritable armada of athletes hide any interesting achievements by any smaller countries?

## Where's all the data?

Type some variant of "Olympics results" into, well, anything and you'll get a deluge of results. But you'll find pretty quickly that it's all the same: country name, gold/silver/bronze medal counts, and typically a fourth column for the total medal count. No mention of the number of athletes. Even the {{% link olympics-athletes-2024 %}}official site{{% /link %}} doesn't aggregate the data into the required form.

The first website I found that _did_ was surprisingly (and unsurprisingly) {{% link wikipedia /%}}. Their {{% link wiki-2024-olympics-participating-nocs %}}page about the event{{% /link %}} shows the list of all countries that participated, along with the number of participants sent by each. In fact, the linked {{% link wiki-2024-olympics-nations %}}category page{{% /link %}} reveals that there is a dedicated article page for each country that participated. The page for {{% link wiki-2024-olympics-canada %}}Canada{{% /link %}}, as an example, starts with an "info box" that concisely shows that 315 people competed and the gold-silver-bronze medals earned were 9-7-11.

So this is how it's gonna go down.

## Forgive me Wikipedia, for I have scraped

The category page contains a link to each country page. The default pagination limits the number of links to 200, so it's necessary to iteratively "walk" the pages by following "next page" links. I lean heavily on the {{% link beautifulsoup /%}} library to parse and navigate the HTML structure:

{{% figure caption="Using Python, find all the Wikipedia pages for countries at the 2024 Olympic Games. The `get()` function is a small wrapper around `requests.get(...).content` that handles things like raising exceptions for error responses and caching results so I don't repeatedly redownload the same URLs while doing iterative testing." %}}

```python
import urllib
from bs4 import BeautifulSoup

ignore_prefixes = (
    '/wiki/Category:',
    '/wiki/Wikipedia:',
    '/w/index.php?title=Category:',
    '/w/index.php?title=Wikipedia:')

cat_url = 'https://en.wikipedia.org/wiki/Category:Nations_at_the_2024_Summer_Olympics'
links = []
while True:
    html = get(cat_url)
    soup = BeautifulSoup(html, features='html5lib')
    mw_pages = soup.find(id='mw-pages')

    has_more = False
    for link in mw_pages.find_all('a'):
        href = link.get('href')
        abs_href = urllib.parse.urljoin(cat_url, href)

        if link.text == 'next page':
            has_more = True
            cat_url = abs_href
        elif not href.startswith(ignore_prefixes):
            links.append(abs_href)

    if not has_more:
        break

# `links` contains one absolute Wikipedia URL for each participating country
```
{{% /figure %}}

The main things to be mindful of here are the fact that some of the links inside the `#mw-pages` element are for navigation or meta pages that we don't want to include. The business of `urljoin()` makes sure that we re-add `https://en.wikipedia.org` to any URLs that came back in a relative form.

{{% margin-note %}}A short aside: What the heck is the purpose of the {{% link wikidata /%}} project? I would have assumed that it would be a rigorously annotated knowledge base of all the facts and figures needed to put this analysis together and it's... not. Maybe I'm dumber than dirt, but I couldn't find a single usable kernel of knowledge there that helped me do this.{{% /margin-note %}} With a list of country URLs in hand, now we have to start working on the per-country pages. The HTML that comes from Wikipedia is a little bit... uh... nope, don't wanna parse that. Luckily the HTML you see is not what the editors actually write. Wikipedia is written in **{{% link wiki-help-wikitext %}}wikitext{{% /link %}}**, and pages frequently use **{{% link wiki-help-infobox %}}infoboxes{{% /link %}}** to consistently lay out page information. Each infobox is based on a shared template (in this case {{% link wiki-template-infobox-country-at-games /%}}) that pulls its data from rigidly-named parameters. All we have to do is get the wikitext for the page and it becomes relatively easy to extract raw infobox source values.

To do _that_, it's necessary to pull data from Wikipedia's API, which I didn't know anything about before I started this endeavor. I still don't know anything about it, but at least I managed to bang some rocks together sharply enough to make it do what I wanted it to do. _Briefly,_ the shape of this is:

{{% figure caption="Get the wikitext for Canada's 2024 Olympics article. I'm quite certain the assignment to `content` is abject crap." %}}

```python
import json

country_page = 'Canada_at_the_2024_Summer_Olympics'
base = 'https://en.wikipedia.org/w/api.php?action=query&prop=revisions&rvslots=*&rvprop=content&format=json&titles='

data = json.loads(get(base + country_page))
content = list(data['query']['pages'].values())[0]['revisions'][0]['slots']['main']['*']

# `content` is the wikitext of the page as a string
```
{{% /figure %}}

From there, a (relatively) tame regular expression capturing group like `competitors\s*=\s*(\d+)` can extract the number of competitors that Canada sent. Similar extractions can be done with `gold`, `silver`, and `bronze`. {{% margin-note %}}It was during this process that I discovered that {{% link wiki-2024-olympics-ghana %}}Ghana's page{{% /link %}} doesn't include any medal counts in the infobox, while every other country does. Any Wikipedia editors wanna jump on that?{{% /margin-note %}}

Armed with all that, and 208 HTTP requests later, we have pretty much what everybody else has... a list of countries, their medal counts, and the various sums that can be found by combining them. This data agrees with the overall stats from the official sources, so we know that Wikipedia got it right and it was scraped accurately.

And now we have a new dimension to play with: Competitors. All 10,795 of them.

## Most and least efficient teams

Some uncommon names start to bubble up when we divide the total medal count by the number of competitors a country sent. This table shows the top and bottom ends of this list, omitting the 114(!) countries at the event that did not win a single medal:

{{% fullwidth %}}
Rank | Country              | Competitors | Gold | Silver | Bronze | Total | Total/Competitors
----:|:---------------------|------------:|-----:|-------:|-------:|------:|-----------------:
1    | Saint Lucia          | 4           | 1    | 1      | 0      | 2     | **50.00%**
2    | Kyrgyzstan           | 16          | 0    | 2      | 4      | 6     | **37.50%**
---  | North Korea          | 16          | 0    | 2      | 4      | 6     | **37.50%**
3    | Grenada              | 6           | 0    | 0      | 2      | 2     | **33.33%**
4    | Bahrain              | 13          | 2    | 1      | 1      | 4     | **30.77%**
86   | Morocco              | 60          | 1    | 0      | 1      | 2     | **3.33%**
87   | Mongolia             | 32          | 0    | 1      | 0      | 1     | **3.13%**
88   | Fiji                 | 33          | 0    | 1      | 0      | 1     | **3.03%**
89   | Refugee Olympic Team | 37          | 0    | 0      | 1      | 1     | **2.70%**
90   | Argentina            | 136         | 1    | 1      | 1      | 3     | **2.21%**
91   | Egypt                | 148         | 1    | 1      | 1      | 3     | **2.03%**
{{% /fullwidth %}}

Counting only gold medals instead, a few new names pop up:

{{% fullwidth %}}
Rank | Country      | Competitors | Gold | Silver | Bronze | Total | Gold/Competitors
----:|:-------------|------------:|-----:|-------:|-------:|------:|----------------:
1    | Saint Lucia  | 4           | 1    | 1      | 0      | 2     | **25.00%**
---  | Dominica     | 4           | 1    | 0      | 0      | 1     | **25.00%**
2    | Bahrain      | 13          | 2    | 1      | 1      | 4     | **15.38%**
3    | Pakistan     | 7           | 1    | 0      | 0      | 1     | **14.29%**
4    | Georgia      | 28          | 3    | 3      | 1      | 7     | **10.71%**
59   | Switzerland  | 127         | 1    | 2      | 5      | 8     | **0.79%**
60   | Argentina    | 136         | 1    | 1      | 1      | 3     | **0.74%**
61   | Egypt        | 148         | 1    | 1      | 1      | 3     | **0.68%**
62   | South Africa | 149         | 1    | 3      | 2      | 6     | **0.67%**
63   | Poland       | 218         | 1    | 4      | 5      | 10    | **0.46%**
{{% /fullwidth %}}

As before, this list omits the 142(!!) countries that did not win a single gold medal.

The efficiency of sending a small but powerful delegation to the Olympics is pretty clear. _Half_ of the athletes sent by Saint Lucia won medals, and _a quarter_ of their team won gold. If one were to hold the United States team to this standard, they would have taken 296 medals, 148 of them gold.

## Throwing population into it

There are something like 8.1 billion people on Earth today, and about 7.8 billion of those people live in countries that participated in the Olympics. If we were to distribute the population of all these countries evenly into the same 10,795 athlete slots of the 2024 Games, about one in 720,016 people globally would participate. Following this distribution, China and India would have each sent over 1,950 competitors apiece.

On the other end of the spectrum, Tuvalu and Nauru would have sent 1.5% of one person each, roughly the mass of a human's forearm.{{% margin-note side %}}And as a result of this research, now I'm probably on more government watchlists than I was before.{{% /margin-note %}} So it's pretty clear that the _populations_ of countries are where the real fun lies. If we know how many people live in each country, we can distort the data in all kinds of amusing ways.

Once again, I defer to Wikipedia's {{% link wiki-country-population /%}} as the source of truth. That page contains a table with the apparent best guess of each country's population as of right now-ish. Although I likely could've done alright trying to parse this as HTML, I chose to use the tried-and-true approach of trawling regular expressions through the wikitext looking for matches.

The meat of this is:

{{% margin-note %}}An earlier/buggier version of this function taught me that an entire country name, Dominica, is a strict prefix of another, the Dominican Republic. Any _Jeopardy!_ writers wanna jump on that?{{% /margin-note %}}{{% figure caption="Using a `wikitext` string fetched from {{% link wiki-country-population /%}}, extract the population count for a single named country." %}}

```python
import re


def get_population(country_name):
    wikitext = '...from List_of_countries_and_dependencies_by_population...'
    lines = iter(wikitext.splitlines())
    for line in lines:
        if f'{{flag|{country_name}}}' not in line:
            continue
        line = next(lines)
        pop_str = re.search(r'n\+p\|[^\d\|]*([\d,]+)', line).group(1)
        pop = int(pop_str.replace(',', ''))
        return pop


# Now something like get_population('New Zealand') returns 5338900
```
{{% /figure %}}

This relies on a couple of Wikipediaisms around template usage. Each country row in this table has a column populated by the `{{flag|...}}` template, which renders as a graphical flag and text link to the passed country name. On the following line (at least, that's how it was when I did this) is the `{{n+p|...|{{worldpop}}}}` template that is responsible for rendering "number and percent" of the passed number divided by the current `{{worldpop}}` value. Using a regular expression that became uglier as I iterated on it, I was eventually able to extract the populations of all the relevant countries. My final table came out sorting the same as theirs, {{% margin-note %}}We're scraping, after all, not building space stations.{{% /margin-note %}} so I'll assume the extraction was correct.

This also required a bit of reverse-diplomacy to map the Olympic Committee names to the country names the Western Wikipedia World uses:

From                           | To
:------------------------------|:--
Chinese Taipei                 | Taiwan
Federated States of Micronesia | Micronesia
Great Britain                  | (just return 65,685,738)
The Gambia                     | Gambia
Virgin Islands                 | U.S. Virgin Islands

The business with Great Britain/United Kingdom is because their population is handled by a {{% link wiki-template-uk-subdivision-population %}}template{{% /link %}} that I have no intention of ever understanding.

## They've got spirit, yes they do

Before even considering medal counts, which countries sent the highest and lowest percentage of their own population to the Olympics?

{{% figure class=fullwidth caption="**Note:** This list omits the Individual Neutral Athletes and Refugee Olympic Team, since they are not \"countries\" with populations in the same sense as everybody else." %}}

Rank | Country                          | Population  | Competitors | Gold | Silver | Bronze | Total | Participation
----:|:---------------------------------|------------:|------------:|-----:|-------:|-------:|------:|-------------:
1    | Tuvalu                           | 10,679      | 2           | 0    | 0      | 0      | 0     | 1 per **5,340**
2    | Palau                            | 16,733      | 3           | 0    | 0      | 0      | 0     | 1 per **5,578**
3    | Monaco                           | 38,367      | 6           | 0    | 0      | 0      | 0     | 1 per **6,395**
4    | San Marino                       | 33,950      | 5           | 0    | 0      | 0      | 0     | 1 per **6,790**
5    | Cook Islands                     | 15,040      | 2           | 0    | 0      | 0      | 0     | 1 per **7,520**
200  | Democratic Republic of the Congo | 98,370,000  | 6           | 0    | 0      | 0      | 0     | 1 per **16,395,000**
201  | Somalia                          | 18,143,379  | 1           | 0    | 0      | 0      | 0     | 1 per **18,143,379**
202  | Myanmar                          | 56,712,559  | 2           | 0    | 0      | 0      | 0     | 1 per **28,356,280**
203  | Bangladesh                       | 169,828,911 | 5           | 0    | 0      | 0      | 0     | 1 per **33,965,782**
204  | Pakistan                         | 241,499,431 | 7           | 1    | 0      | 0      | 1     | 1 per **34,499,919**
{{% /figure %}}

The median participation rate lies somewhere between Japan and North Macedonia, roughly 1 per 306,000. Applying that uniformly to all participating countries, the U.S. would've sent 1,100 athletes and the Cook Islands would have sent a human leg (without foot).{{% margin-note side %}}Dear FBI, I promise I'm a pretty cool dude once you get to know me.{{% /margin-note %}}

## Making it everybody's business

Now we can do something profoundly stupid: We'll simply ignore the number of competitors and just use the medal counts divided by the populations of entire countries. Given the way Olympic events are scored and ranked, this should be a completely fair and unbiased measurement of the athletic prowess of all nations, right?{{% margin-note side %}}No. Wrong.{{% /margin-note %}}

Well, no matter. Here are the highest and lowest medal totals divided by _everybody_ in the country:

{{% figure class=fullwidth caption="**Note:** Excludes Individual Neutral Athletes, Refugee Olympic Team, and every country that earned no medals." %}}

Rank | Country     | Population    | Gold | Silver | Bronze | Total | Total/Population
----:|:------------|--------------:|-----:|-------:|-------:|------:|----------------:
1    | Grenada     | 112,579       | 0    | 0      | 2      | 2     | 1 per **56,290**
2    | Dominica    | 67,408        | 1    | 0      | 0      | 1     | 1 per **67,408**
3    | Saint Lucia | 184,100       | 1    | 1      | 0      | 2     | 1 per **92,050**
4    | New Zealand | 5,338,900     | 10   | 7      | 3      | 20    | 1 per **266,945**
5    | Bahrain     | 1,577,059     | 2    | 1      | 1      | 4     | 1 per **394,265**
86   | Peru        | 34,038,457    | 0    | 0      | 1      | 1     | 1 per **34,038,457**
87   | Egypt       | 105,914,499   | 1    | 1      | 1      | 3     | 1 per **35,304,833**
88   | Indonesia   | 281,603,800   | 2    | 0      | 1      | 3     | 1 per **93,867,933**
89   | India       | 1,404,910,000 | 0    | 1      | 5      | 6     | 1 per **234,151,667**
90   | Pakistan    | 241,499,431   | 1    | 0      | 0      | 1     | 1 per **241,499,431**
{{% /figure %}}

And the same, using gold medals instead of overall totals:

{{% figure class=fullwidth caption="**Note:** Excludes Individual Neutral Athletes and every country that earned no gold medals." %}}

Rank | Country     | Population  | Gold | Silver | Bronze | Total | Gold/Population
----:|:------------|------------:|-----:|-------:|-------:|------:|----------------:
1    | Dominica    | 67,408      | 1    | 0      | 0      | 1     | 1 per **67,408**
2    | Saint Lucia | 184,100     | 1    | 1      | 0      | 2     | 1 per **184,100**
3    | New Zealand | 5,338,900   | 10   | 7      | 3      | 20    | 1 per **533,890**
4    | Bahrain     | 1,577,059   | 2    | 1      | 1      | 4     | 1 per **788,530**
5    | Slovenia    | 2,123,949   | 2    | 1      | 0      | 3     | 1 per **1,061,975**
59   | Brazil      | 203,080,756 | 3    | 7      | 10     | 20    | 1 per **67,693,585**
60   | Egypt       | 105,914,499 | 1    | 1      | 1      | 3     | 1 per **105,914,499**
61   | Ethiopia    | 109,499,000 | 1    | 3      | 0      | 4     | 1 per **109,499,000**
62   | Indonesia   | 281,603,800 | 2    | 0      | 1      | 3     | 1 per **140,801,900**
63   | Pakistan    | 241,499,431 | 1    | 0      | 0      | 1     | 1 per **241,499,431**
{{% /figure %}}

So there they are, your new 2024 Olympic champions: Dominica! For the U.S. team to have won at a rate comparable to this Caribbean powerhouse, we would've needed to take home nearly 5,000 gold medals.

Last I checked, we did not.

## Do what thou wilt

I'll end this with a table of all the data, assuming you have working JavaScript. {{% margin-note %}}If not, the [JSON source is here](data.json).{{% /margin-note %}} The column headers are each clickable for your sorting pleasure:

{{% fullwidth %}}
<div id="data-table">[the table would've gone here, if the script had worked]</div>
{{% /fullwidth %}}

The column descriptions are:

Country
: The name of the National Olympic Committee the country competed as.

Population
: The total population of the country at the time of writing, shortly after the closing ceremony.

Competitors
: The number of athletes sent to the 2024 Olympic Games by that country.

Participation
: The **competitors** divided by the **population** expressed as a fraction.

Gold, Silver, Bronze
: The number of gold/silver/bronze medals won by the country during the 2024 Olympic Games.

Gold/Pop
: The **gold** divided by **population** expressed as a fraction.

Gold/Comp
: The **gold** divided by **competitors** expressed as a fraction.

Total
: The combined sum of **gold**, **silver**, and **bronze** medals won.

Tot/Pop
: The **total** divided by **population** expressed as a fraction.

Tot/Comp:
: The **total** divided by **competitors** expressed as a fraction.

I'm not _entirely_ sure that there's a real conclusion I'm angling for here, although I'm not the first person to have this kind of thought. There have been some {{% link josa-population-adjusted-olympics-rankings %}}legitimate papers written by actual scholars{{% /link %}} on the topic, whereas I'm just some guy who converts "I wonder if..." into "Now why did I...?"
