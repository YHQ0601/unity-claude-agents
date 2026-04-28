#!/usr/bin/env bash
set -euo pipefail

INPUT="$(cat)"
PROMPT="$(printf '%s' "$INPUT" | jq -r '.prompt // ""' 2>/dev/null || printf '%s' "$INPUT")"
HINTS=()

add_hint() {
  HINTS+=("$1")
}

if echo "$PROMPT" | grep -Eqi 'unity|c#|csharp|script|code|component|prefab|scene|scriptableobject|mono|monobehaviour|input|ui logic|gameplay|combat|inventory|quest|level|spawn|controller|manager|compile|error|exception|nullreference|skill|ability|item|character|脚本|代码|组件|预制体|场景|输入|界面逻辑|玩法|战斗|背包|任务|关卡|生成|控制器|管理器|编译|报错|异常|空引用|系统|技能|道具|角色'; then
  add_hint "This looks like Unity implementation work. Consider using implement-unity-feature and unity-code-worker."
fi

if echo "$PROMPT" | grep -Eqi 'skill|ability|character skill|技能|角色技能'; then
  if [ -f "docs/systems/skill-system.md" ]; then
    add_hint "This looks like a skill-system task. Read docs/systems/skill-system.md, then verify against current code."
  else
    add_hint "This looks like a skill-related task, but no skill-system card exists. Inspect the repository first and do not assume an existing skill system."
  fi
fi

if echo "$PROMPT" | grep -Eqi 'plan|design|scope|should we|is it worth|worth it|requirement|feature request|mixed|unclear|break down|方案|计划|范围|要不要|是否值得|需求|功能需求|不明确|拆分|怎么做|必要性'; then
  add_hint "This may need task classification. Consider using task-intake before implementation."
fi

if echo "$PROMPT" | grep -Eqi 'task card|docs/tasks|claim task|close task|next task|open task|todo|in progress|blocked|done|任务卡|领取任务|关闭任务|下一个任务|未完成任务|进行中|阻塞|已完成'; then
  add_hint "This looks like task-card workflow. Read docs/templates/TASK_TEMPLATE.md and docs/tasks/*.md; do not claim a task unless the user explicitly asks."
fi

if echo "$PROMPT" | grep -Eqi 'architecture|refactor|system boundary|data model|save data|economy|performance|extensible|scalable|long-term|abstraction|maintainability|架构|重构|系统边界|数据模型|存档|经济|性能|扩展性|长期维护|抽象|可维护|系统设计'; then
  add_hint "This may affect architecture or long-term maintainability. Consider using architecture-reviewer before implementation."
fi

if echo "$PROMPT" | grep -Eqi 'temporary asset|placeholder|blockout|greybox|whitebox|mock visual|prototype visual|primitive blockout|basic color|temporary model|artist handoff|artist replacement|replacement anchor|placeholder prefab|placeholder material|placeholder icon|placeholder vfx|placeholder ui|临时资源|占位|白盒|灰盒|临时模型|基础颜色|美术交接|美术替换|替换锚点|占位预制体|占位材质|占位图标|占位特效|占位界面'; then
  add_hint "This includes temporary or replaceable asset work. Consider using build-placeholder-assets and placeholder-asset-worker."
  add_hint "Placeholder work should use primitive-based visuals, stable replacement anchors, and an artist replacement plan, not final art."
fi

if echo "$PROMPT" | grep -Eqi 'check|test|validate|verify|verification|review|qa|risk|safe|problem|bug|regression|serialization|missing reference|prefab reference|scene reference|playmode|editmode|检查|测试|验证|评审|风险|安全|有没有问题|回归|序列化|引用丢失|预制体引用|场景引用'; then
  add_hint "This asks for verification or risk review. Consider using unity-validate-change and unity-qa-checker."
fi

if echo "$PROMPT" | grep -Eqi 'handoff|summary|summarize|continue later|session state|memory|document decision|adr|what changed|next step|stale|交接|总结|下次继续|会话状态|记忆|记录决策|决策记录|改了什么|下一步|过期信息'; then
  add_hint "This looks like continuity or project memory work. Consider using handoff and project-memory-curator."
fi

if [ "${#HINTS[@]}" -gt 0 ]; then
  echo "## Auto Routing Hints"
  for hint in "${HINTS[@]}"; do
    echo "- $hint"
  done
fi
