# Shader contracts
SwiftUI supplies leading arguments to stitchable functions; additional arguments must match the Swift Shader invocation in order and type. Check installed SDK and Apple docs for availability.

```metal
#include <metal_stdlib>
#include <SwiftUI/SwiftUI.h>
using namespace metal;
[[ stitchable ]] half4 tint(float2 position, half4 color, float amount);
[[ stitchable ]] float2 warp(float2 position, float amount);
[[ stitchable ]] half4 sampleLayer(float2 position, SwiftUI::Layer layer, float amount);
```

These illustrate colorEffect, distortionEffect and layerEffect respectively. Custom vertex/fragment/compute functions use their own stage attributes and resource bindings. maxSampleOffset is a sampling bound, not a replacement for layout padding or clipping review.
Document point versus pixel coordinates. Sample layer edges deliberately and preserve premultiplied alpha. Validate scalar/vector packing, parameter ranges, finite math and texture bounds. Do not copy GLSL syntax or Three.js uniforms into MSL unchanged.
