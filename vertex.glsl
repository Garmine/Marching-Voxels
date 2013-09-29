#version 330

uniform  samplerBuffer marchingCubes;		//Marching cube triangle positions
uniform usamplerBuffer marchingBitmasks;	//Marching cube configuration ID (the 8 voxels ored together)
uniform  samplerBuffer voxelPositions;		//Voxel positions
uniform mat4 world;							//World matrix
uniform vec3 cam;							//Camera position

layout (location = 0) in int dummy;

flat out int instanceID;

void main(){
	vec3 translation = texelFetch(voxelPositions, gl_InstanceID).xyz;
	
	int bitmask = int(texelFetch(marchingBitmasks, gl_InstanceID).x);
	vec3 edge = texelFetch(marchingCubes, bitmask*15 + gl_VertexID).xyz;
	
	instanceID = gl_InstanceID;
	gl_Position = world * vec4(edge+translation-cam, 1.0);
}