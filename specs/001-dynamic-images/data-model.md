# 数据模型 (Data Models): 动态图片加载

## 实体 (Entities)

### `图片元数据 (ImageMetadata)`
代表用于描述单张图片及其配文的数据结构。该结构的数据将会被写入并存放在 `assets/images/` 目录下的某一个 JSON 文件（如 `images.json`）中。

**字段 (Fields):**
- `src` (字符串 String): 图片的相对路径或者文件名 (例如: `cute_love_candies_1772443765380.webp`)。
- `text` (字符串 String): 图片附带的描述性标题或文字 (例如: `甜甜的心动`)。

**关联关系 (Relationships):**
- 无 (None)。

**验证规则 (Validation Rules):**
- `src` 必须是一个代表图片文件路径的有效字符串。
- `text` 必须是一个字符串 (允许为空字符串)。

## 预期的 JSON 结构示例 (Expected JSON Structure)
```json
[
  {
    "src": "assets/images/image1.jpg",
    "text": "Caption for image 1"
  },
  {
    "src": "assets/images/image2.png",
    "text": "Caption for image 2"
  }
]
```
