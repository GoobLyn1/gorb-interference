vec3 sinTriad(float inp){
    return vec3(sin(inp),sin(inp+radians(120.)),sin(inp+radians(240.)));
}
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec3 t=vec3(0.);
    vec3[3] q=vec3[3](vec3(0.),vec3(0.),vec3(0.));
    
    vec2 uv = fragCoord / iResolution.xy;
    vec3 paint = vec3(uv, 0.9);
    vec2 center = vec2(0.5 + 0.2 * sin(iTime), cos(iTime)/8.+.5);
    vec2 point = (uv - center) * vec2(iResolution.x/iResolution.y, 1.0);
    float bright = 2./(pow(length(point*(15.+7.*sin(3.*iTime/7.))),2.)+1.);
    vec3 qtmp[3] = vec3[](sinTriad((iTime+distance(center,uv))),sinTriad((iTime+distance(center,uv))*5./3.),sinTriad((iTime+distance(center,uv))*1.5));
    q[0] += qtmp[0];
    q[1] += qtmp[1];
    q[2] += qtmp[2];
    fragColor = 
    vec4(vec3(bright)*vec3(length(q[0]),length(q[1]),length(q[2])),1.);
}