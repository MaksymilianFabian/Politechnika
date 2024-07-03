
#version 330

uniform sampler2D textureMap0;
// Zmienne interpolowane
in vec4 ic;
in vec4 n;
in vec4 l;
in vec4 l2;
in vec4 v;
in vec2 iTexCoord0;
// Zmienna wyjściowa fragment shadera
out vec4 pixelColor;

void main(void) {
    // Znormalizowane interpolowane wektory
    vec4 ml = normalize(l);
    vec4 ml2 = normalize(l2);
    vec4 mn = normalize(n);
    vec4 mv = normalize(v);
    
    // Wektory odbite
    vec4 mr = reflect(-ml, mn);
    vec4 mr2 = reflect(-ml2, mn);
    
    // Parametry powierzchni
    //vec4 kd = ic;
    vec4 kd = texture(textureMap0,iTexCoord0);//main
    vec4 ks = vec4(1, 1, 1, 1);
    vec4 ks2 = vec4(1, 0, 0, 1);
    
    // Obliczenie modelu oświetlenia
    float nl = clamp(dot(mn, ml), 0, 1);
    float nl2 = clamp(dot(mn, ml2), 0, 1);
    float rv = pow(clamp(dot(mr, mv), 0, 1), 50);
    float rv2 = pow(clamp(dot(mr2, mv), 0, 1), 50);
    
    pixelColor = vec4(kd.rgb * nl, kd.a) + vec4(kd.rgb * nl2, kd.a) + vec4(ks.rgb * rv, 0) + vec4(ks2.rgb * rv2, 0);
}