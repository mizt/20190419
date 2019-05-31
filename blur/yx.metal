#include <metal_stdlib>
using namespace metal;

#define vec2 float2
#define vec3 float3
#define vec4 float4
#define ivec2 int2
#define ivec3 int3
#define ivec4 int4
#define mat2 float2x2
#define mat3 float3x3
#define mat4 float4x4

struct VertInOut {
    float4 pos[[position]];
    float2 texcoord[[user(texturecoord)]];
};
struct FragmentShaderArguments {
    device float2 *resolution[[id(0)]];
    texture2d<float> texture[[id(1)]];
};

vertex VertInOut vertexShader(constant float4 *pos[[buffer(0)]],constant packed_float2  *texcoord[[buffer(1)]],uint vid[[vertex_id]]) {
    VertInOut outVert;
    outVert.pos = pos[vid];
    outVert.texcoord = float2(texcoord[vid][0],1-texcoord[vid][1]);
    return outVert;
}

 fragment float4 fragmentShader(VertInOut inFrag[[stage_in]],constant FragmentShaderArguments &args[[buffer(0)]]) {
    
    constexpr sampler SAMPLAR(coord::normalized, filter::nearest);
    
    float x = inFrag.texcoord.x;
    float y = inFrag.texcoord.y;

    float2 resolution = args.resolution[0];

    int w = resolution.x;
    int h = resolution.y; 

    int ix = x*(w);
    int iy = y*(h);
    
    int n = iy*w+ix;
    
    int addr = (n%w)*h+(n/w);
    
    int px = addr%w;
    int py = addr/w;
    
    float4 argb = args.texture.sample(SAMPLAR,float2(px/(float)(w),py/(float)(h)));
    return float4(argb.r,argb.g,argb.b,1.0);
    
}