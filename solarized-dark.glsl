#version 330

in vec2 texcoord;
uniform sampler2D tex;
uniform float opacity;

vec4 default_post_processing(vec4 c);

vec4 window_shader() {
    vec2 texsize = textureSize(tex, 0);
    vec4 color = texture2D(tex, texcoord / texsize, 0);

    // make it grayscale first
    color = vec4(vec3(0.2126 * color.r + 0.7152 * color.g + 0.0722 * color.b) * opacity, color.a * opacity);
    color.r = 1-color.r;
    color.g = 1-color.g;
    color.b = 1-color.b;

    color.r *= (253-7);
    color.r += 7;
    color.r /= 255;

    color.g *= (246-54);
    color.g += 54;
    color.g /= 255;

    color.b *= (227-66);
    color.b += 66;
    color.b /= 255;

    return default_post_processing(color);
}
