#version 330

//uniform samplerBuffer colors;

//flat in int instanceID;
flat in vec4 color;

out vec4 outColor;

void main(){
	outColor = color;
}
