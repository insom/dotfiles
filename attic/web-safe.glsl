#version 330

in vec2 texcoord;
uniform sampler2D tex;
uniform float opacity;

vec4 default_post_processing(vec4 c);

float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898,78.233)))* 43758.5453123);
}

vec4 window_shader() {
    vec2 texsize = textureSize(tex, 0);
    float q = random(texcoord);
    vec4 color = texture2D(tex, texcoord / texsize, 0);

    color.r *= 6;
    color.r = round(color.r);
    color.r /= 6;

    color.g *= 6;
    color.g = round(color.g);
    color.g /= 6;

    color.b *= 6;
    color.b = round(color.b);
    color.b /= 6;

    return default_post_processing(color);
}
