# 本 Fork 相对上游 Mintimate/oh-my-rime 的修改总结（方式 B 已完成）

已用 **`*.custom.yaml`** 做覆写，**squirrel.yaml、weasel.yaml、double_pinyin.schema.yaml 已恢复为上游原版**，你的修改全部在 custom 与新增文件中，与上游隔离。

---

## 一、当前修改清单（仅 custom + 新增）

### 1. 新增文件（仅本 fork 有）

| 文件 | 说明 |
|------|------|
| `lua/append_space_after_eng.lua` | 英文选词上屏后自动加空格 |
| `MY_CHANGES.md` | 本说明 |

### 2. 通过 custom 覆写（原版文件已恢复为上游）

| 文件 | 覆写内容 |
|------|----------|
| `squirrel.custom.yaml` | 横向候选、分页提示、皮肤 mojave_dark |
| `weasel.custom.yaml` | 横向候选（与 Mac 一致） |
| `double_pinyin.custom.yaml` | 双拼原始显示、关闭英文降权、英文后自动空格 |

### 3. 与上游一致、无需提交改动的

- `squirrel.yaml`、`weasel.yaml`、`double_pinyin.schema.yaml` 已恢复为上游内容，与 Mintimate/oh-my-rime main 一致。

### 4. 仅本地、不提交

- `配置建议与皮肤说明.md` 已加入 `.gitignore`，不会 push。

---

## 二、推送到你的 Fork

在 Rime 配置目录（已 clone Cloud1e/oh-my-rime 或即将 push 的目录）执行：

```bash
cd ~/Library/Rime   # Mac；Windows 为 %APPDATA%\Rime

# 若尚未添加上游
git remote add upstream https://github.com/Mintimate/oh-my-rime.git
git fetch upstream

# 只提交 custom + 新增文件（.gitignore 若你改了也可提交）
git add lua/append_space_after_eng.lua squirrel.custom.yaml weasel.custom.yaml double_pinyin.custom.yaml .gitignore MY_CHANGES.md
git status   # 确认没有 配置建议与皮肤说明.md、且 squirrel/weasel/double_pinyin.schema 为上游版本
git commit -m "feat: 横向候选、双拼原始显示、英文后空格、暗色皮肤（custom 覆写）"
git push origin main
```

之后合并上游：`git fetch upstream && git merge upstream/main`，一般无冲突；你的偏好始终在 `*.custom.yaml` 中。

---

## 三、installation.yaml 说明

- 上游的 `installation.yaml` 已在 `.gitignore` 中，不会提交。
- 本机可继续保留你写过的 sync_dir、installation_id 注释或配置，仅本地生效。
