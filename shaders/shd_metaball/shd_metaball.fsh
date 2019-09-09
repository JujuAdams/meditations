precision lowp float;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 sample = texture2D(gm_BaseTexture, v_vTexcoord);
    float alpha = max(sample.r, max(sample.g, sample.b));
    alpha = clamp(pow(alpha, 12.0) + 0.3*alpha, 0.0, 1.0);
    gl_FragColor = v_vColour * vec4(sample.rgb, alpha);
}