(() => {
    const CANVAS_ID = 'gl-square';
    const VERTICES = new Float32Array([
        // X     Y   R   G   B
        -0.2,  0.2,  1,  0,  0,
         0.2,  0.2,  0,  1,  0,
        -0.2, -0.2,  0,  0,  1,
         0.2, -0.2,  1,  1,  0]);
    const VERT_SZ = VERTICES.BYTES_PER_ELEMENT;
    let xpos = -1, xdir = 0, ypos = -1, ydir = 0, program;

    addEventListener('load', () => {
        const gl = document.getElementById(CANVAS_ID).getContext('webgl2');
        program = gl.createProgram();

        const vertexShader = gl.createShader(gl.VERTEX_SHADER);
        gl.shaderSource(vertexShader,
            `#version 300 es
            in vec2 position;
            in vec3 color;
            uniform mat4 transform;
            out vec3 vertcolor;
            void main() {
                gl_Position = transform * vec4(position, 0, 1);
                vertcolor = color;
            }`
        );
        gl.compileShader(vertexShader);
        gl.attachShader(program, vertexShader);
        gl.deleteShader(vertexShader);

        const fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
        gl.shaderSource(fragmentShader,
            `#version 300 es
            precision highp float;
            in vec3 vertcolor;
            out vec4 fragcolor;
            void main() {
                fragcolor = vec4(vertcolor, 1);
            }`
        );
        gl.compileShader(fragmentShader);
        gl.attachShader(program, fragmentShader);
        gl.deleteShader(fragmentShader);

        gl.linkProgram(program);
        gl.useProgram(program);

        gl.bindBuffer(gl.ARRAY_BUFFER, gl.createBuffer());
        gl.bufferData(gl.ARRAY_BUFFER, VERTICES, gl.STATIC_DRAW);

        let loc = gl.getAttribLocation(program, 'position');
        gl.vertexAttribPointer(loc, 2, gl.FLOAT, false,  5 * VERT_SZ, 0);
        gl.enableVertexAttribArray(loc);

        loc = gl.getAttribLocation(program, 'color');
        gl.vertexAttribPointer(loc, 3, gl.FLOAT, false,  5 * VERT_SZ,  2 * VERT_SZ);
        gl.enableVertexAttribArray(loc);

        requestAnimationFrame(do_frame);
    });

    function do_frame(now_ms) {
        const canvas = document.getElementById(CANVAS_ID);
        const gl = canvas.getContext('webgl2');

        if (canvas.width !== canvas.parentElement.offsetWidth) {
            canvas.width = canvas.parentElement.offsetWidth;
            canvas.height = canvas.width;
            gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);
        }

        const theta = ((now_ms / 1000) % 1) * -(Math.PI * 2);
        const mat = new Float32Array([
             Math.cos(theta), Math.sin(theta), 0,               0,
            -Math.sin(theta), Math.cos(theta), 0,               0,
             0,               0,               1,               0,
             xpos,            ypos,            0,               1]);

        gl.clearColor(0, 0, 0, 0);
        gl.clear(gl.COLOR_BUFFER_BIT);
        gl.uniformMatrix4fv(gl.getUniformLocation(program, 'transform'), false, mat);
        gl.drawArrays(gl.TRIANGLE_STRIP, 0, 4);

        if (xpos <= -1) xdir = 1; else if (xpos >= 1) xdir = -1;
        if (ypos <= -1) ydir = 1; else if (ypos >= 1) ydir = -1;

        xpos += xdir * 0.01;
        ypos += ydir * 0.021;  //break up the monotony

        requestAnimationFrame(do_frame);
    }
})();
