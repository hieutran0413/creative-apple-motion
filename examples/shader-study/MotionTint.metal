#include <metal_stdlib>
using namespace metal;
[[ stitchable ]] half4 motionTint(float2 position, half4 color, float amount) {
    half mixAmount = half(clamp(amount, 0.0f, 1.0f));
    half3 tint = half3(0.35h, 0.65h, 1.0h) * color.a;
    return half4(mix(color.rgb, tint, mixAmount), color.a);
}
