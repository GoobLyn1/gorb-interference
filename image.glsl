vec3 sinTriad(float inp){
    return vec3(sin(inp),sin(inp+radians(120.)),sin(inp+radians(240.)));
}
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec3 paint = vec3(uv, 0.9);
    vec2 center = vec2(0.5 + 0.2 * sin(iTime), cos(iTime)/8.+.5);
    vec2 point = (uv - center) * vec2(iResolution.x/iResolution.y, 1.0);
    float bright = 2./(pow(length(point*(15.+7.*sin(3.*iTime/7.))),2.)+1.);
    vec3 q[3] = vec3[](sinTriad(iTime+distance(center)),sinTriad,sinTriad);
    fragColor = 
    vec4(vec3(bright)*vec3(
        sin((iTime)*7./13.)/3.+.5,
        cos((iTime)*11./7.)/3.+.5,
        cos((iTime)*15./13.)/3.+.5
    ),1.);
}