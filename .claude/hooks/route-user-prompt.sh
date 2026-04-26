#!/usr/bin/env bash
set -euo pipefail

INPUT="$(cat)"
PROMPT="$(echo "$INPUT" | jq -r '.prompt // ""')"

echo "## Auto Routing Hints"

if echo "$PROMPT" | grep -Eqi 'unity|c#|脚本|代码|prefab|scene|scriptableobject|mono|编译|报错|玩法|系统|背包|技能|道具|角色'; then
  echo "- This looks like Unity development work. Consider using unity-code-worker."
fi

if echo "$PROMPT" | grep -Eqi '技能|skill|ability|角色技能'; then
  echo "- This looks like a skill-system task. Consider reading docs/systems/skill-system.md before implementation."
fi

if echo "$PROMPT" | grep -Eqi '美术|图标|icon|素材|角色|特效|vfx|动画|ui|按钮|宣传图|商店图|占位图|音效|audio'; then
  echo "- This includes asset-related work. Consider using asset-spec-worker."
fi

if echo "$PROMPT" | grep -Eqi '架构|重构|方案|系统设计|是否值得|必要性|长期|扩展|性能|数据结构'; then
  echo "- This may affect architecture. Consider using architecture-reviewer before implementation."
fi

if echo "$PROMPT" | grep -Eqi '检查|测试|验证|安全吗|有没有问题|review|qa|风险'; then
  echo "- This asks for verification. Consider using unity-qa-checker."
fi

if [ -f ".claude-local/NEEDS_KB_REVIEW" ]; then
  echo "- NEEDS_KB_REVIEW exists. Consider running sync-knowledge before relying on local memory."
fi
