#!/usr/bin/env bash
set -euo pipefail

INPUT="$(cat)"
PROMPT="$(echo "$INPUT" | jq -r '.prompt // ""')"

echo "## Auto Routing Hints"

echo "- Start with task-intake when scope/necessity is unclear."

if echo "$PROMPT" | grep -Eqi 'unity|c#|脚本|代码|prefab|scene|scriptableobject|mono|编译|报错|玩法|系统|背包|技能|道具|角色'; then
  echo "- This looks like Unity development work. Consider using unity-code-worker."
fi

if echo "$PROMPT" | grep -Eqi '技能|skill|ability|角色技能'; then
  if [ -f "docs/systems/skill-system.md" ]; then
    echo "- This looks like a skill-system task. Read docs/systems/skill-system.md, then verify against current code."
  else
    echo "- This looks like a skill-related task, but no skill-system card exists. Inspect the repository first and do not assume an existing skill system."
  fi
fi

if echo "$PROMPT" | grep -Eqi '临时资源|占位|placeholder|blockout|cube|基础颜色|临时模型|美术替换|图标|icon|素材|特效|vfx|动画|ui|按钮|角色|道具|prop'; then
  echo "- This includes temporary or replaceable asset work. Consider using placeholder-asset-worker."
  echo "- The worker should create primitive-based placeholders and an artist replacement plan, not final art."
fi

if echo "$PROMPT" | grep -Eqi '架构|重构|方案|系统设计|是否值得|必要性|长期|扩展|性能|数据结构'; then
  echo "- This may affect architecture. Consider using architecture-reviewer before implementation."
fi

if echo "$PROMPT" | grep -Eqi '检查|测试|验证|安全吗|有没有问题|review|qa|风险'; then
  echo "- This asks for verification. Consider using unity-qa-checker."
fi
