# Validation
Verified on 2026-11-16 using Xcode 27.2 (27B48).

- Plugin manifest validator: passed.
- Five skill frontmatter validators: passed.
- Relative references from all skills: resolved.
- ShaderStudy.swift: type-check passed for arm64 macOS 14 and arm64 iOS 17 Simulator SDK target (shared iPhone/iPad source).
- MotionTint.metal: compiled and linked to metallib for macOS and iPhoneOS SDKs.
- Codex installation: creative-apple-motion@personal installed successfully; installed payload checked against source after final packaging.

Not run: full Xcode app build, runtime shader lookup/rendering, simulator UI interaction, physical iPhone/iPad execution, Catalyst compilation, VoiceOver, performance profiling or behavioral evaluation of skill routing. The example is an integration snippet, not a standalone app. These checks do not certify 3D renderer output; the 3D skill supplies implementation guidance, not an included renderer.

To validate an implementation, add the sample files to an app target and follow skills/apple-motion-review/SKILL.md with the actual supported destinations. All guidance remains subject to the project's SDK, deployment targets and device capabilities.
