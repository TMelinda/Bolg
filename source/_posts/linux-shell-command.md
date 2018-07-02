---
title: Linux shell常用命令
---
以下为一些常用的linux命令

[TOC]



## 1.求两个文件的交集和差集

### comm命令
>comm命令可以用于两个文件之间的比较，它有一些选项可以用来调整输出，以便执行交集、求差、以及差集操作。要注意两个文件必须是*排序和唯一(sorted and unique)的*，默认输出为三列，第一列为是A-B，第二列B-A，第三列为A交B。

- 交集：打印出两个文件所共有的行。
- 求差：打印出指定文件所包含的且不相同的行。
- 差集：打印出包含在一个文件中，但不包含在其他指定文件中的行。

命令

> comm [参数选项]  文件名1 文件名2

选项

- 1：不显示在第一个文件出现的内容；
- 2：不显示在第二个文件中出现的内容；
- 3：不显示同时在两个文件中都出现的内容。

示例

``` bash
localhost:test tammy$ cat a.txt
1
2
3
5
6
10
2
localhost:test tammy$ cat b.txt
2
3
4
7
9
10
3

localhost:test tammy$ comm a.txt b.txt
1
		2
		3
	4
5
6
10
2
	7
	9
	10
	3
localhost:test tammy$ comm <(sort a.txt) <(sort b.txt)
1
		10
		2
2
		3
	3
	4
5
6
	7
	9
localhost:test tammy$ comm <(sort a.txt|uniq) <(sort b.txt|uniq)
1
		10
		2
		3
	4
5
6
	7
	9
```
输出的第一列只包含在aaa.txt中出现的行，第二列包含在bbb.txt中出现的行，第三列包含在aaa.txt和bbb.txt中相同的行。各列是以制表符（\t）作为定界符。

**交集**

*打印出2个文件的交集，需要删除第一列和第二列*

```
localhost:test tammy$ comm -1 -2  <(sort a.txt) <(sort b.txt)
10
2
3
```

**差集**

*通过删除不需要的列，分别得到2个文件的差集*

a.txt的差集

```
localhost:test tammy$ comm -2 -3 <(sort a.txt|uniq) <(sort b.txt|uniq)
1
5
6
```

b.txt的差集

```
localhost:test tammy$ comm -1 -3 <(sort a.txt|uniq) <(sort b.txt|uniq)
4
7
9
```

**求差**

*打印出两个文件中不相同的行，需要删除第三列*

```
localhost:test tammy$ comm -3 <(sort a.txt|uniq) <(sort b.txt|uniq) | awk '{print $1}'
1
4
5
6
7
9
```

awk操作为对输出做处理~



### grep命令

*grep命令的功能强大，此处仅介绍文件比较功能*

命令

>grep -F -f file1 file2
>
>功能描述：将file2中存在file1的行输出———>2个文件的交集。但需要注意的是，如果是求交集，需要uniq下。

示例

```
localhost:test tammy$ cat a.txt
1
2
3
5
6
10
2
localhost:test tammy$ cat b.txt
2
3
4
7
9
10
3
localhost:test tammy$ grep -F -f a.txt b.txt
2
3
10
3
localhost:test tammy$ grep -F -f a.txt b.txt | sort | uniq
10
2
3
```

那差集如何求呢？依旧可以用上grep命令

命令

> grep -F -v -f file1 file2
>
> 说明：grep的-v 是取反的意思，如上意思为：输出file2中不包含file1的行  ———>file2的差集

示例

```
localhost:test tammy$ grep -F -v -f a.txt b.txt
4
7
9
localhost:test tammy$ grep -F -v -f b.txt a.txt
1
5
6
```





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
