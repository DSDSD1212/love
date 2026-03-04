# 契约 (Contract): 图片目录 JSON 规范

这份契约文档清晰定义了由构建/执行脚本过程所生成的 JSON 文件的预期格式，以便供前端应用消费及解析。

**存储位置 (Location):** `assets/images/images.json`

## 目的 (Purpose)
为静态的前端网页提供一份能够被发现（discoverable）、包含图片和相关元数据的列表清单，从根本上绕过浏览器不允许读取本地目录列表的安全限制。

## 格式 (Format - JSON Array of Objects)

```javascript
[
  {
    "src": "string", // 在该目录内的相对路径或图片文件名
    "text": "string" // 该图片的配文/标题
  }
]
```

## 示例 (Example)
```json
[
  {
    "src": "cute_love_candies_1772443765380.webp",
    "text": "甜甜的心动"
  },
  {
    "src": "aesthetic_flower_garden_pink_1772443785699.webp",
    "text": "想带你散步"
  }
]
```

## 消费者预期 (Consumer expectations)

- 前端必须 (MUST) 能够通过优雅降级/容错处理去应对 JSON 文件丢失或者格式破坏的情况。
- 前端必须 (MUST) 能够应对 JSON 数组为空的边界情况。
