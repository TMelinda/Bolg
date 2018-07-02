---
title: Linux shell常用命令
---
以下为一些常用的linux命令

## 1.求两个文件的交集和差集

如下有2个文件a.txt b.txt ，求出2个文件的交集和差集
```
localhost:test tammy$ cat a.txt
1
2
3
5
6
10

localhost:test tammy$ cat b.txt
2
3
4
7
9
10
```

### comm命令
>comm命令可以用于两个文件之间的比较，它有一些选项可以用来调整输出，以便执行交集、求差、以及差集操作。

- 交集：打印出两个文件所共有的行。
- 求差：打印出指定文件所包含的且不相同的行。
- 差集：打印出包含在一个文件中，但不包含在其他指定文件中的行。

选项
- 1：不显示在第一个文件出现的内容；
- 2：不显示在第二个文件中出现的内容；
- 3：不显示同时在两个文件中都出现的内容。

``` bash
localhost:test tammy$ comm a.txt b.txt
1
		2
		3
	4
5
6
10
	7
	9
	10
```
输出的第一列只包含在aaa.txt中出现的行，第二列包含在bbb.txt中出现的行，第三列包含在aaa.txt和bbb.txt中相同的行。各列是以制表符（\t）作为定界符。

More info: [Writing](https://hexo.io/docs/writing.html)

### Run server

``` bash
$ hexo server
```

More info: [Server](https://hexo.io/docs/server.html)

### Generate static files

``` bash
$ hexo generate
```

More info: [Generating](https://hexo.io/docs/generating.html)

### Deploy to remote sites

``` bash
$ hexo deploy
```

More info: [Deployment](https://hexo.io/docs/deployment.html)
