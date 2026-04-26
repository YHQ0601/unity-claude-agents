# Skill System Card

## Purpose
角色技能系统。负责技能释放、冷却、命中、伤害、表现触发和配置读取。

## Related Paths
- Assets/Scripts/Skills/
- Assets/Scripts/Combat/
- Assets/Scripts/Characters/
- Assets/GameData/Skills/
- Assets/Prefabs/VFX/Skills/
- Assets/Art/Skills/

## Current Entry Points
- 技能逻辑入口：
- 技能配置入口：
- 角色绑定入口：
- 伤害结算入口：
- VFX/SFX 触发入口：

## Add New Skill Workflow
1. 找相似技能。
2. 新增或复用 SkillConfig。
3. 实现技能行为。
4. 接入角色配置。
5. 补充图标 / VFX / 动画需求。
6. 验证冷却、命中、伤害、资源引用。

## Similar Skills
- DashSkill:
- KnockbackSkill:
- AreaSkill:

## Do Not
- 不要为了一个普通技能重构整个技能系统。
- 不要新增通用框架，除非至少 3 个技能反复遇到同类问题。
- 不要直接修改旧技能行为，除非任务明确要求。
- 不要把表现逻辑和伤害结算强耦合。

## Last Verified
Commit:
Updated:
