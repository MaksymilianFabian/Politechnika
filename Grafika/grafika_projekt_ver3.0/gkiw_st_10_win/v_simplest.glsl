
#version 330

// Zmienne jednorodne
uniform mat4 P;
uniform mat4 V;
uniform mat4 M;
uniform vec4 lp = vec4(-5, 5, 4, 1);
uniform vec4 lp2 = vec4(7, 10, -6, 1);

// Atrybuty
in vec4 vertex; // Współrzędne wierzchołka w przestrzeni modelu
//in vec4 color; // Kolor związany z wierzchołkiem
in vec4 normal; // Wektor normalny w przestrzeni modelu
in vec2 texCoord0;

// Zmienne interpolowane
//out vec4 ic;
out vec4 l;
out vec4 l2;
out vec4 n;
out vec4 v;
out vec2 iTexCoord0;

void main(void) {
    l = normalize(V * lp - V * M * vertex); // Wektor do pierwszego źródła światła w przestrzeni oka
    l2 = normalize(V * lp2 - V * M * vertex); // Wektor do drugiego źródła światła w przestrzeni oka
    v = normalize(vec4(0, 0, 0, 1) - V * M * vertex); // Wektor do obserwatora w przestrzeni oka
    n = normalize(V * M * normal); // Wektor normalny w przestrzeni oka
    iTexCoord0=texCoord0;
    //ic = color;
    
    gl_Position = P * V * M * vertex;
}