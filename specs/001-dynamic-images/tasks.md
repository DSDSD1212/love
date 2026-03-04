# 任务列表：动态加载图片 (Dynamic Image Loading)

**输入**: 来自 `/specs/001-dynamic-images/` 的设计文档
**前置条件**: plan.md (必要), spec.md (必要，用于用户故事), research.md, data-model.md, contracts/images-json.md, quickstart.md

**组织方式**: 任务按用户故事分组，以便独立实现和测试每个故事。

## 第一阶段：环境与基础设置 (Shared Infrastructure)

**目标**: 为新的动态图片加载功能初始化项目结构和必要的基础设施。

- [ ] T001 创建 `scripts/generate_image_list.js` 脚本，用于扫描 `assets/images/` 目录，并根据数据模型和契约生成 `images.json` 文件。

---

## 第二阶段：前置阻塞任务 (Foundational)

**目标**: 必须在实现任何用户故事之前完成的核心基础设施。

- [ ] T002 运行 node 脚本 `node scripts/generate_image_list.js` 以创建初始的 `assets/images/images.json` 文件。

**检查点**: 基础设置就绪 - 现在可以开始实现用户故事。

---

## 第三阶段：用户故事 1 - 在照片墙中展示所有可用的照片 (优先度: P1) 🎯 MVP (最小可行性产品)

**目标**: 基于动态生成的 `images.json` 文件，在照片墙中显示所有可用的图片。

**独立测试标准**: 
1. 在 assets 目录中添加或删除图片。
2. 运行生成脚本。
3. 验证页面是否自动更新并包含与目录中完全相同数量的图片，且无需修改任何 HTML 或 JS 源代码。

### 用户故事 1 的实现任务

- [ ] T003 [P] [US1] 更新前端文件 `/home/sds/my_test/love/love/index.html`，移除照片墙容器中硬编码的静态 `<img>` 元素。
- [ ] T004 [US1] 在前端 JavaScript（`index.html` 或主 JS 文件）中实现 `fetch('assets/images/images.json')` 逻辑来获取图片列表。
- [ ] T005 [US1] 实现 DOM 操作逻辑，根据获取到的 JSON 数据动态渲染图片元素和描述文字 (caption)。
- [ ] T006 [US1] 实现降级/错误处理逻辑，以防 `images.json` 加载失败或数组为空的情况。

**检查点**: 至此，用户故事 1 应完全可用，照片墙实现了完美的动态化。

---

## 第四阶段：收尾与跨模块关注点 (Polish & Cross-Cutting Concerns)

**目标**: 改进和最后的完善工作。

- [ ] T007 [P] 审查并完善 `scripts/generate_image_list.js`，确保它只包含有效的图片格式（例如：`.jpg`, `.png`, `.webp`）。
- [ ] T008 更新任何必要的文档或 README 说明，提及新增的构建脚本运行要求。

---

## 依赖关系与执行顺序

### 阶段依赖

- **第一阶段 (Setup)**: 无依赖 - 可以立即开始。
- **第二阶段 (Foundational)**: 依赖第一阶段的完成。
- **用户故事 (第三阶段及以上)**: 依赖第二阶段的完成。
- **收尾阶段 (Final Phase)**: 依赖所有用户故事的完成。

### 用户故事依赖

- **用户故事 1 (P1)**: 可以在第二阶段之后开始。不依赖其他故事。

### 并行开发机会

- T003 可以与 T004 并行执行，因为移除硬编码 HTML 并不严格阻塞编写新的 JS fetch 逻辑，尽管它们最终会在 T005 中集成在一起。

---

## 实现策略

### 优先发布 MVP (仅限于用户故事 1)

1. 完成第一阶段：编写生成脚本。
2. 完成第二阶段：运行脚本创建 JSON。
3. 完成第三阶段：完成用户故事 1（拉取并渲染数据）。
4. **停止并验证**: 验证图片能在页面中动态加载。
