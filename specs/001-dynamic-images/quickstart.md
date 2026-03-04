# 快速入门指南 (Quickstart): 动态图片加载

此特性使得“照片墙”功能能够动态加载 `assets/images` 目录下存放的所有图片。因为本程序是一个纯静态站点且没有后端接口，因此我们通过一个运行简单的脚本当作前置步骤生成一个 `images.json` 索引文件，供前端发起请求来拉取信息。

## 如何更新图片 (Updating Images)

当你向 `assets/images/` 目录追加了新的照片后，只需运行一下这个生成脚本来刷新 `images.json` 文件即可，这样前端网页就能顺利发现并加载出那些刚加入的新图片了。

1. 把你新准备的图片全部扔进 `assets/images/` 目录里去。
2. 运行生成脚本:
   ```bash
   node scripts/generate_image_list.js
   ```
   *(或者视不同实现而定，运行相对应的脚本名称即可)*

## 实现细节 (Implementation Details)

写在 `index.html` 中的前端 JS 逻辑会发起一次指向 `assets/images/images.json` 的 `fetch` 请求以获取图片列表资源，并在收到响应后动态生成所需的 HTML DOM 节点元素，用来填充并展示出最终的动态相册。
