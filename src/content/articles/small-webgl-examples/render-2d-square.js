(() => {
    const CANVAS_ID = '2d-square';
    const ASPECT = 16 / 9, TAU = Math.PI * 2, HALF_PI = Math.PI / 2;
    let xpos = 0, xdir = 0, ypos = 0, ydir = 0;

    addEventListener('load', function do_frame(now_ms) {
        const theta = ((now_ms / 1000) % 1) * TAU;
        const canvas = document.getElementById(CANVAS_ID);
        const ctx = canvas.getContext('2d');

        if (canvas.width !== canvas.parentElement.offsetWidth) {
            canvas.width = canvas.parentElement.offsetWidth;
            canvas.height = canvas.width / ASPECT;
        }

        ctx.fillStyle = 'orange';
        ctx.strokeStyle = 'blue';
        ctx.lineWidth = 3;

        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.beginPath();

        const pct = canvas.width / 100;
        for (let i = 0; i <= TAU; i += HALF_PI) {
            let vx = Math.cos(theta + i) * (10 * pct);
            let vy = Math.sin(theta + i) * (10 * pct);
            ctx.lineTo(vx + xpos, vy + ypos);
        }

        ctx.fill();
        ctx.stroke();

        if (xpos <= 0) xdir = 1; else if (xpos >= canvas.width) xdir = -1;
        if (ypos <= 0) ydir = 1; else if (ypos >= canvas.height) ydir = -1;

        xpos += xdir * (0.5 * pct);
        ypos += ydir * (0.5 * pct);

        requestAnimationFrame(do_frame);
    });
})();
