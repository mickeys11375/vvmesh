#version 330
in vec3 vertexMC;
in vec3 vertexColor;
in uint primitive_id;

uniform mat4 MCVCMatrix;
uniform mat4 VCDCMatrix;
uniform mat4 MCDCMatrix;

out float depth;
out vec3 color;
flat out uint primitive_id_VS;

void main ()
{
    vec4 vertexVC = MCVCMatrix * vec4(vertexMC, 1.);
    depth = vertexVC.z;

    gl_Position = MCDCMatrix * vec4(vertexMC, 1.);

    primitive_id_VS = primitive_id;
    color = vertexColor;
}