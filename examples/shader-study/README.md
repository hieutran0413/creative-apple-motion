# Shader study
Add ShaderStudy.swift and MotionTint.metal to an existing app target. The sample requires iOS/iPadOS 17 or macOS 14 and an SDK with SwiftUI Shader support. Use ShaderStudy() from an availability-gated parent when supporting earlier systems; present a native static fallback there. Compile the .metal file in the same target's default Metal library.

A button changes tint and scale; Reduce Motion disables spatial emphasis and animation. The decorative shape is hidden from accessibility, and the button remains a native control. This sample deliberately has no continuous render clock, model assets or third-party dependencies.

Compile/type-check results are recorded in ../../VALIDATION.md. Compilation does not verify runtime library lookup, actual shader appearance, accessibility behavior or performance. Run inside the target app to verify those behaviors, including live Reduce Motion changes.
