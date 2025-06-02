Emacs简介
---------

Emacs 是一个文本编辑器系列，包含有多个分支，其中最主流的一支是 GNU Emacs，大多数情况
下所说的 Emacs 都是指 GNU Emacs。Emacs 这一名字最早来源于 “Editor MACroS”，后来也有
人称它集合了五个主要功能键的首字母 Esc、Meta、Alt、Ctrl、Shift。

Emacs 与 Vi 共同被称为最古老的 Unix 编辑器，一代代程序员对 Emacs 和 Vi （尤其后来出
现的 Vim）产生了无休止的争论。Emacs 诞生已有近五十年时间，是世界上最古老而依然活跃的开
源软件之一。

Emacs 的主要思路是大量依赖组合快捷键实现高效编辑，这直接导致了想要流畅使用 Emacs 必须
要记忆 Emacs 的大量快捷键，需要相当一段时间熟悉。此外，Emacs 编辑器本身所使用的编程语
言是 Emacs Lisp 语言，Lisp 语言的方言之一。Lisp 语言是诞生于 1958 年的世上第二古老高
级程序设计语言，其语言以“列表”（List）作为语法和核心数据结构。

特别的，在 Linux/macOS 系统的终端中，可以使用部分 Emacs 快捷键；在 macOS 系统中的各
种文本编辑框，如备忘录、浏览器搜索框等也都支持 Emacs 光标移动快捷键。因此可以说，掌握
Emacs 快捷键，在各种操作系统中都可以享受其带来的方便快捷。

Emacs 相关版本，Emacs-gtk 使用 GTK 作为图形库的版本。Emacs-lucid 由 Ubuntu 特别调
整的版本，主要用于Ubuntu系统，它提供了更好的兼容性和性能优化，特别是在图形界面方面。
emacs-nox 是不带 x system 的 emacs 版本，这个版本不包含图形界面支持，主要用于没有图
形界面的环境，如服务器或终端。它专注于文本模式下的操作，适合那些主要在命令行环境下工作
的用户‌。

Emacs 命令行启动： ::

    emacs           # 正常启动
    emacs -nw       # 不带图形界面
    emacs file.txt  # 打开一个文件

Emacs键位
----------

Emacs 有五个功能键： Control 、 Meta 、 Shift 、 Super 、 Hyper 。其中部分名称读
者可能不熟悉，那是几十年前的键盘上的按键名称，其中的 Hyper 键在现代键盘上已经消失了。
Meta 对应于普通 PC 键盘上的 Alt 键，Mac 电脑上的 Option 键。Super 对应 PC 键盘上的
Win 键，Mac 电脑上的 Command 键。但 Super 键一般用于电脑自身的快捷键，因此 Emacs
平常不使用与 Super 相关的快捷键，Emacs 的绝大多数快捷键都是使用 Control 和 Meta 键，
而其中一大部分都是只使用 Control 键。 ::

    Emacs功能键     缩写    对应键盘按键
    Control         C       Ctrl / Control
    Meta            M       Alt / Option
    Shift           S       Shift / Shift
    Super           s       Win / Command
    Hyper           H       无

尽管 Hyper 键已经消失，但 Emacs 依然可以使用这个功能键，例如可以考虑将不常用的按键设
定为 Hyper 键以拓宽快捷键。可以看到， Control 键是 Emacs 程序员键盘的“重灾区”，按
Control 键的小指也是 Emacs 程序员最易出问题的部位，因此笔者强烈建议，在你正式使用
Emacs 后改变键盘键位保护手指。 例如笔者将 Control 键改到了大小写锁定键上（读者可以调
换两个键，但考虑到实际很少用大小写锁定键，笔者索性不要大小写锁定键了）。也可以将 PC 键
盘上的 Win 键、Mac 键盘上 的 Command 键与 Control 调换，这样使用强壮的大拇指也没有
问题。如果不想全局改变，也可以只在 Emacs 内部进行，后面会提到。笔者作为 Mac 用户，推荐
一款改键软件 Karabiner-Elements，它甚至可以将 Emacs 常用键位完全拓展到全局。

Emacs 用连字符表示“同时按下”。例如，我们用 C-a 表达“先按下 Control 键不要松，再按下
a 键”。 C-x b 则表达“先按下 Control 键不松，按下 x 键，松开这两个键，按下 b 键”。
C-S-<mouse-1> 表达“同时按下 Control 键和 Shift 键，然后鼠标左键点击”。这里提到了鼠标
是因为 Emacs 图形界面支持鼠标操作，并且在有些场景下的确使用鼠标更为方便（例如无规律的
多光标选择）。

特别的， Meta 键做前缀有两种按法，例如 M-x 可以“按住 Meta 键不要松，再按下 x 键”，也
可以“先按一下 Esc 键松开，再按一下 x 键”。后者是为了在应对无法使用 Meta 键的硬件或系
统。但实际操作有很多不便，因此读者尽可能使用 Alt / Option 作为 Meta 键来按。一些终端
例如 Mac 自带的终端默认不会把 Option 键作为 Meta 传入，但只需打开它的偏好设置，其中
“Profiles - Keyboard” 中有一项“将 Option 用作 Meta 键”，勾选即可。iTerm2 同理。

在介绍具体的快捷键之前，要先说明 Emacs 的主体逻辑。与其它编辑器类似，Emacs 也是通过命
令进行交互的。而所谓命令，就是 Emacs 中使用 Elisp 语言定义的一些函数。这些函数可以完
成一些功能。例如，即使是最最简单的“将光标上移一行”，也对应着命令 previous-line 。一切
操作都对应一个命令，而快捷键的本质是在调用这些命令。

对 Emacs 输入命令需要先按下 M-x，此时你会看到 Emacs 最下面的空行上出现了 "M-x"，然后
等待你的输入，随后你便可以输入一个函数名。这一快捷键可以说是最重要的一个快捷键了，只要
有它，即使你忘记了其它快捷键，也可以输入函数名进行调用。命令名的传统是有连字符连接的多
个有意义的英文单词。在输入时可以用空格代替连字符。也可以使用 <tab> 键自动补全。自然，
M-x 也对应着命令 execute-extended-command。

一些系统对有些键位会做映射。例如 macOS 就会将 ``C-/`` 映射为 ``C-_``， ``C-SPC``
映射为 ``C-@``。不影响日常使用，但是读者想覆盖键位时需要注意。

一些命令： ::

    M-x version
    M-x list-packages
    M-x package-install
    M-x package-delete
    M-x set-variable
    M-x customize
    M-x customize-group
    M-x customize-variable
    M-x customize-face
    M-x customize-themes
    M-x help-with-turorial-spec-language
    M-x duplicate-line
    M-x copy-from-above-command
    M-x eval-region
    M-x eval-buffer

帮助信息： ::

    C-h ?       根据帮助列表，输入你想查看的帮助选项
    C-h t       打开快速指南教程
    C-h b       显示所有的快捷键绑定
    C-h c       快捷键简要描述帮助
    C-h k       快捷键详细描述帮助
    C-h x       显示命令帮助信息
    C-h f       显示函数帮助信息
    C-h v       显示变量帮助信息
    C-h e       显示 minibuffer 打印的所有消息
    C-h a ...   搜索命令
    C-h d ...   搜索文档

基础快捷键： ::

    C-<key>     CTRL+<key>
    M-<key>     META/EDIT/ALT+<key>，如果没这三个键可等效按 ESC 然后再按 <key>
                如果你不小心按了 ESC，可以再连续按两次 ESC 取消它
    M-~         M-x tmm-menubar 打开互动菜单
    C-x C-c     退出 Emacs
    C-g         取消当前输入的命令，或当前执行过久的或失去响应的命令
    C-x k       在Emacs启动后，关掉初始页会自动开启一个 *scratch* 文件缓冲
    C-M-x       eval-defun，执行当前函数
    C-x C-e     执行当前光标行代码
    C-j         在 lisp 主模式下执行代码并打印
    M-:         在 minibuffer 中执行代码
    C-x C-=     放大字号，继续调整可以直接按 =/-/0，按 C-g 退出字体调整
    C-x C--     缩小字号
    C-x C-0     重置字号

光标移动： ::

    C-p C-n     上下移动（previous/next）
    C-b C-f     左右移动（back/forward）
    M-b M-f     移动到单词开头，单词结尾之后

        英文单词由数字和字母构成，空白和标点符号以及下划线都会分割单词。
        中文单词由中文字符构成，其他字符对单词进行分割。
        挨在一起的中文单词和英文单词，是两个独立的单词。

    C-a C-e M-m 光标移动到行首，行结尾之后，M-m移动到行首非空白字符处
    M-a M-e     光标移动到句首，句子结尾之后
    M-< M->     光标移动到文件开头，文件结尾之后

        英文句子以点号加换行、或点号加两个空格结束，中文句子以句号结束。

    M-r         光标移动到当前窗口中间行的行首，开始行的行首，结尾行的行首
    C-l         将光标所在行滚动到窗口中央，窗口顶部，窗口底部
    C-v M-v     将下一页或上一页滚动到窗口顶部（PageDn/PageUp），下页开头会保留上页最后两行内容
    C-M-v       第二个窗口向下翻页（C-M- 需要按同一侧的两个键）
    C-M-S-v     第二个窗口向上翻页（C-M-S 需要按同一侧的三个键）

    M-8 C-p     光标向上移动八行
    M-8 C-n     光标向下移动八行
    M-g M-g ln  跳转到对应文本行，等价于 M-g g ln

    C-SPC       不仅是选中文本，其本质是设定一个标记（mark）
    C-SPC C-SPC 按两次 C-SPC 打了标记，但没有选中文本，然后光标移动到别的位置甚至别的文件
    C-u C-SPC   输入该命令即可跳转回到刚刚的位置

文本搜索： ::

    C-s         光标位置向后搜索，输入内容光标会自动移动到第一个匹配位置（不会搜索整个文件，不方便）
                C-s 继续匹配下一个位置
                C-r 回到上一个匹配位置
                RET 停留在当前匹配位置
                C-g 取消这次搜索，回到搜索前的位置
    C-M-s       使用正则表达式向后搜索
    M-s o       在新窗口列出匹配列表

    C-r         光标位置向前搜索
    C-M-r       使用正则表达式向前搜索

        正则表达式（https://www.emacswiki.org/emacs/RegularExpression）

文本编辑： ::

    C-t         交换光标前一字符与当前字符，光标移动到下一字符（transpose-chars）
    M-t         交换光标前一单词与当前单词（或下一单词），光标移动到这两个单词之后（transpose-words）
    C-x C-t     交换光标上一行与当前行，光标移动到下一行开头（transpose-lines）
    C-M-t       交换两个带平衡括号的表达式（transpose-sexps）
    M-x transpose-sentences     交换句子
    M-x transpose-paragraphs    交换段落
    M-x transpose-regions       交换选择区域，交换当前选择区域与前一次选择区域的内容

        如果在行尾使用 C-t，它不会将行尾字符与换行符交换（这毫无意义），而是交换行尾的最后两个字符。
        M-t 会交换光标前后的单词，单词之间的标点符号不会移动。例如 FOO, BAR 会变成 BAR, FOO，而不
        是 BAR FOO,。当光标位于行尾时，它会将光标前的单词与下一行的第一个单词交换。

    C-o         在当前字符处输入换行符，创建一个新行，光标保持位置不变
    C-x C-o     将当前行后面的所有空行都删掉，如果当前行是空行则只保留当前空行并把前后的所有空行都删掉

    M-l M-u M-c 将当前字符开始的单词，或后面一个单词，转成小写大写或首字母大写
    M-% (M-S-5) 查找和替换 M-x query-replace
    C-M-%       使用正则表达式查找 M-x query-replace-regexp
        SPC/y   替换并移动到下一个
        DEL/n   跳过并移动到下一个
        !       替换剩余所有的匹配
        ^       回到前一个匹配
        u       撤销前一次替换
        U       撤销所有的替换
        e       编辑替换字符串
        E       编辑替换字符串并带额外情况
        RET/q   退出替换
    DEL M-DEL   删除光标左边一个字符或单词，<DEL> 即退格键（backspace），不是键盘上的 delete 键
    C-d M-d     删除光标右边一个字符或单词
    C-S-DEL     移除光标所在行，图形界面可以用这个快捷键，但终端常会拦截这个按键只会执行<DEL>
    C-k         移除右侧直到行尾，再按一次移除换行符
    C-u 3 C-k   移除光标右侧开始的3行，包括3个换行符
    M-k         移除右侧直到句尾，连续按继续移除下一句
    C-SPC       把光标移动到某处，按下 C-SPC 打一个标记，然后任意移动光标可以看到半透明的选择框。
                这和使用鼠标进行选择是一样的，按 C-g 可以取消选择。注意，C-<SPC> 往往被中文用户
                设定成输入法热键，如果这样，C-<SPC> 就被系统拦截而无法传递给 Emacs 了，这种情况
                下可以使用 C-@ 代替（注意是按键 C-S-2）。
    M-w         复制所选区域的内容（复制）
    C-w         移除所选区域的内容（剪切）

        上面 “删除” 和 “移除” 两种说法，删除是真的删除（delete），而移除（kill）相当于剪切，之后
        可以再次插入到其他位置（insert），相当于粘贴。

Emacs 内部维护了一个环形 “剪贴板历史”，当你想插入之前移除的内容时（即粘贴之前剪切的内
容），可按 C-y 召回（yank），它会将最近一次移除的内容粘贴回来。如何粘贴历史记录呢？在
一次 C-y 的基础上，再按 M-y，就可以得到倒数第二次移除的内容，再按 M-y 即可得到倒数第
三次移除的内容，以此类推。 ::

    C-y         粘贴最近的一次剪切的内容或复制的内容，每个 C-w 都是一次单独的剪切，而
                连续的 C-k 或 M-k 操作如果其内容是连续的则被当成是一次剪切。每个 M-w
                都是单独的一次复制。

    M-y         在一次 C-y 的基础上连续按 M-y 可以选择粘贴剪贴板历史中的某一次内容：
                C-y         M-y         M-y         ...     M-y         M-y             M-y         ...
                最近一次    倒数第二次   倒数第三次           最后一次     回到最近一次     倒数第二次

    C-/ 或 C-_ 或 C-x u（其中 C-_ 在某些终端上可以不按 shift 键，即 C--）
                撤销（undo）前一个命令造成的改变，只对改变文字的命令有效。如果前面的
                操作是对字符进行编辑，如输入字符删除字符，则会以组为单位每组最多20次
                对字符的编辑，例如你刚刚删了5个字符，可以一次成功撤销。这是为了减少撤
                销插入字符动作时需要输入的 C-/ 次数。

    C-g C-/     连续按 C-/ 可以不断撤销前面的操作，但是如果按了一次 C-g 之后，撤销的
                方向就变了，相当于重做（redo）前面的撤销。Emacs 对于操作的历史记录也
                维护了一个环形历史，按下 C-g 之后可理解为沿环移动的方向改变了。所以
                Emacs 其实不分 undo 和 redo，它只是沿着环形的操作历史，恢复某个历史
                节点的内容现场。

重复操作： ::

    C-u 数字 命令快捷键
                把一个命令重复执行任意次数，如果不带数字，默认是 4 次。这个命令的本质
                是对后面的命令传递了一个数字参数。
    M-数字      也可以按下 M- 同时输入数字，例如 M-8 * 输入八个星号，等价于 C-u 8 *
    C-M-数字    或同时按下 C-M- 输入数字
    C-数字      在 Emacs 的图形界面中，也可以只按下 C- 输入数字

        C-u 其实是前缀参数中的 universal-argument 命令快捷键。其后加数字对大部分命令
        来说是次数，但部分命令不一定表示次数，例如 C-u M-x 表示基于前缀字符串的搜索命
        令。可以类比键盘上的 shift 键，按下 1 是输入数字 1，但按下 shift+1 是叹号，
        C-u 就类似 shift 的作用，并且由于可以接数字等额外参数，C-u 非常强大。具体每个
        命令的前缀参数有何作用参看对应的文档说明。

文件缓冲
--------

文件操作命令汇总： ::

    快捷键              对应命令名                  操作描述
    f10                 M-x menu-bar-open           下拉菜单栏，仅命令行终端
    M-~                 M-x tmm-menu                互动菜单，命令行终端和图形界面都适用
    C-x C-f <file>      M-x find-file               打开文件或创建一个新文件打开
    C-x C-s             M-x save-buffer             保存文件
    C-x C-r <file>      M-x find-file-read-only     只读打开
    C-x C-v <file>      M-x find-alternate-file     打开与当前文件名称相近的文件
    C-x C-q             M-x read-only-mode          将当前文件设置为只读模式
    C-x b <file>        M-x switch-to-buffer        切换到对应的文件缓冲
    C-x b               M-x switch-to-buffer        默认的两个文件缓冲相互切换
    C-x C-b             M-x list-buffers            显式文件缓冲列表，让用户选择
        p n                                         上一行，下一行
        q                                           退出列表
        d                                           标记一个文件缓冲打算关闭
        s                                           标记一个文件缓冲打算保存
        u                                           取消一个文件缓冲标记
        x                                           执行刚刚标记过的删除和保存操作
    C-x o               M-x other-window            如果当前光标没在 *Buffer List*，可用该命令切入
    C-<mouse-1>         M-x mouse-buffer-menu       通过鼠标左键菜单切换缓冲
    C-x k               M-x kill-buffer             关闭文件缓冲
    C-x C-f <dir>                                   打开目录或创建一个新目录打开
    C-x C-j                                         打开当前文件的目录
        h                                           目录编辑器帮助（directory editor, dired），dired 会把目录下的文件都列出，
                                                    随后用户可以对文件进行操作，可以删除文件、拷贝文件、对比文件、更改权限等等。
                                                    可以看帮助中的 Keybindings 了解 Dired 中可以使用的命令。
        p n                                         光标上下移动到相应的文件上，然后使用命令快捷键对该文件进行操作
        m                                           标记一个文件
        u                                           取消文件选择
        d                                           标记删除
        x                                           执行操作
        i               dired-maybe-insert-subdir   将对应的子目录显式到当前缓冲，如果已经存在则光标移动到该子目录
        ^                                           回到父目录
        l               dired-do-redisplay          刷新目录内容
        r <new-name>                                重命名或移动文件

Emacs 界面的一些术语：

**Frame**
    如果用图形界面打开 Emacs 程序，那么一整个程序窗口被称为 Frame，如果打开了多个窗口
    就有多个 Frame；如果在终端内打开 Emacs，那么 Emacs 所占据的整个终端的界面被称为
    Frame。
**Menu Bar**
    菜单栏，在 Frame 的最上方。默认包括了 File、Edit 等下拉菜单。在终端中不能用鼠标
    时，需要用 menu-bar-open 命令打开，对应快捷键 <f10> 。此外还有一个 M-~ 键（对应
    命令 tmm-menu）可以从下方展开互动界面打开菜单。
**Tool Bar**
    工具栏，只在图形界面时可以使用。由于它十分丑陋且功能又很基本，可以关掉工具栏——在
    配置文件中加入代码 (tool-bar-mode -1)。
**Echo Area**
    整个界面最下方的一行是“回显区”，用以打印各种简短的信息。
**Window**
    Tool Bar 以下（如果有）、Echo Area 以上这一整个区域，称为窗口（Window）。 可以
    看到 Emacs 的窗口和我们日常使用电脑所说的窗口不是一个东西，一定要注意，不然在配
    置、调用命令或者在网上搜索信息时会搞错。我们日常称为窗口的在 Emacs 中被称为
    Frame，而 Frame 内的核心区域才被称为 Window。
    Mode Line：Window 最下面的一行即为“模式行”。这里会显示当前 Buffer 的一些信息，
    大概包括了文件编码、是否修改、当前 Buffer 名、光标所在位置占全文百分比、行号（L1
    表示第一行）等等。它的内容可以自定义，也可以使用 smart-mode-line 插件进行管理。
**Scroll Bar**
    图形界面时 Window 最右侧的滚动条。事实上在 Emacs 中根本不需要用滚动条，可以关闭
    让界面更清爽，在配置中加入 (when (display-graphic-p) (toggle-scroll-bar -1))
    表示在是用图形界面时关闭滚动条。
**Cursor**
    光标是一个 1 字符宽的方块，但其真正表达的位置是其左侧的长边，即两字符之间。文档中
    有一些关于其显示效果的设置，例如可以换成大家日常更习惯的小竖线（bar），但其实笔者
    觉得还是方块（box）比较显眼，看习惯也挺好。
**Point**
    光标所在的位置称为 Point。区别于光标的是，光标有且只有一个，但 Point 是针对
    Buffer 的，每个 Buffer 都有一个 Point。许多命令的触发都要读取 Point 信息。

命令行可以使用 emacs <filename> 的方式来打开文件，而想要在 Emacs 内打开一个文件，
按下 C-x C-f （find-file），此时 Echo area 会出现 “Find file: ”，后面为一个路径，
输入文件对应的路径即可打开相应文件。如果想新建文件，只需要输入一个不存在的文件名即可。
输入时可以使用 <tab> 键自动补全，就和 Linux 中类似。保存文件使用命令 C-x C-s。

打开文件只读 C-x C-r。 打开另一名称相近的文件 C-x C-v，此时下面的路径会自动以当前文件
全名作为初始路径（而不是目录的路径），这样方便稍微修改文件名以打开另一文件。将已打开的
文件切换为只读模式 C-x C-q。

Emacs 可以打开多个文件，同样使用 C-x C-f 打开即可。但是如果打开了第二个文件，便会发现
第一个文件就消失不见了，应当去哪里找呢？事实上，所有打开的文件都会被放入一个被称为
Buffer 的对象中，当打开了第二个文件时，第一个文件所在的 Buffer 会切入后台，而第二个文
件的 Buffer 会占据当前的 Window。Buffer 的名字显示在 Mode line 中间，通常是文件名本
身。Emacs 也可以用这个方式打开目录（文件夹），会显示出目录内的文件（此即 Linux 的设计
理念，一切皆为文件，即使是目录也本质上是一个文件），可以用光标选择想打开的文件。

切换 Buffer 有三类方法，简短的方法是使用 C-x b，输入 Buffer 的名字后按回车即可切换。
Echo area 中会提示你，如果什么也不输直接按回车，可以跳转到当前默认的 Buffer 中，这样
方便在两个文件中来回切换。在输入 M-x 或 C-x b 后在 Echo area 显示的等待输入的区域被
称为 Minibuffer，所以它们的输入方式是共通的，都可以用相同的补全机制等。

显然这样如果 Buffer 多了会记不住名字也不便于管理，于是可以使用第二个方法，C-x C-b，
此时会弹出一个 Window，名为 “*Buffer List*”，列出了当前所打开的所有 Buffer。其中可
以看到多个以星号（*）开头结尾的 Buffer，那些都是 Emacs 用于输出一些信息的 Buffer，
并不是由于打开文件而产生。例如 “*Messages*” 是 Emacs 的一些输出信息。“*scratch*”
是可以编写一些 Elisp 代码的地方。Buffer 开头如果是 %，表示这个 Buffer 被修改过而没有
保存。如果当前光标没有在 “*Buffer List*” 中可以用 C-x o 键切换到 “*Buffer List*”
中。

可以通过光标选择切换到某个 Buffer。同时在这个 "*Buffer List*" 中有很多功能可以使用。
按问号可以显示帮助。常见的操作例如 q 退出，d 标记一个 Buffer 打算关闭，s 标记一个
Buffer 打算保存，u 取消标记，x 执行刚刚标记过的删除和保存操作。事实上，在这里上下移动
光标也不需要 C-p 和 C-n，直接按 p 和 n 即可。想要关闭当前的 Buffer？直接在当前的
Buffer 处按下 C-x k 即可。

此外，第三种方法是使用 C-<mouse-1>（mouse-1 表示鼠标左键），通过鼠标菜单切换 Buffer。

使用 Emacs 打开文件后，会发现目录下会多一个和打开的文件同名但是后面多一个 ~ 字符的文
件，例如打开了 names.txt 后会出现 names.txt~ ， 这是 Emacs 的备份机制，防止程序或系
统崩溃，或是用户误操作破坏了文件。可以设置关闭备份 (setq make-backup-files nil)，以
及文件数量上限等。

目录操作
~~~~~~~~

Dired，即 Directory Editor，是 Emacs 自带的用以处理目录和文件的功能。常见的操作例如
删除文件、将文件从一处拷贝至另一处，更高级的操作如对比两个文件的异同、更改权限、链接文
件等等，都可以通过 Dired 实现。

启动 Dired 非常简单，只需要按下 C-x C-f，输入一个目录（文件夹）而非文件，就会进入
Dired。更标准的方式是按 C-x d 或调用 M-x dired 命令然后输入一个目录的名字启动，但前
者与打开文件的快捷键相同，更易记忆。

当已经打开了一个文件时，输入 C-x C-j 可以打开当前文件所在的目录。Dired 会把目录下的
文件都列出来，随后用户可以对文件进行操作。此时可以按下 h （Help）来打开帮助，可以翻到
下面的 "Keybindings"，里面列出了所有在 Dired 中可以使用的命令。

Dired 基本操作逻辑为，通过光标上下移动（此时不需要按 Control 而直接按 p 和 n 就可以
上下移动光标）到相应文件上，按下一个命令快捷键来对该文件调用命令。想要批量操作，只需要
按 m（Mark）就可以选择，按 u（Unmark）来取消选择。批量删除时，按 d（Delete）标记删
除，按 x （Execute）执行删除。可以执行的命令全都在 "Keybindings" 中罗列，读者只需要
自行查阅即可。

这里举一个简单的例子，我们想要将 a.txt 和 b.txt 文件挪到 subdir 中，首先我们可以对
subdir 按下 i 来展开这个子目录，随后对两个文本文件按下 m 标记，然后按下 R（Rename），
在回显区输入 path/to/subdir/，按下回车。这里熟悉 Linux 的读者应该清楚，移动文件的本
质就是重命名（Rename），所以 Dired 里没有所谓的“移动”这个操作，而只有重命名。

缓冲模式
~~~~~~~~

Emacs 的核心要素之一是模式（mode）。一个模式对应一组环境，不同模式可以分别进行配置，
应对不同的场景。例如，编写 C++ 代码时就对应 c++-mode，编写 Python 时则使用
python-mode。在不同的语言的 mode 中，编译、执行的方式都是不同的，这样只要事先定义好
mode，就可以在使用过程中方便切换各种需求场景。Emacs mode 分两类，主模式（Major mode）
和次模式（Minor mode）。

主模式默认根据 Buffer 的文件类型来选择，一个 Buffer 只能对应一个主模式。例如 Emacs
发现你打开了 .cpp 为后缀的文件，就会把 Buffer 自动设置成 c++-mode ，发现你打开了 .py
后缀的文件，就把相应 Buffer 自动设置为 python-mode，最直观的区别是 Emacs 为不同语言
的源码提供了不同的语法高亮。主模式的名字会显示在 Mode line 上。

我们也可以手动切换主模式，只需要按下 M-x，输入相应的模式名称即可。通常来说其实我们不需
要手动设置。最基本的主模式是 Fundamental，就是没有进行任何配置的模式。

同一个 Buffer 可以有多个次模式，次模式可以进一步调整、增加一些配置。通常来说，插件都是
靠次模式来起作用的。当我们安装插件时，插件的官网会提示如何设置这个插件，其中大多都会使
用次模式。

每一个主模式都对应一个 Mode hook，hook 是挂钩的意思，Mode hook 的作用就是当启动一个
主模式时，自动执行一些已经“挂钩”到这个主模式的函数或次模式。由此，我们可以自由地向一个
主模式上挂上各种功能，在启动这个主模式时就可以自动跟随着一起启动。

Mode hook 的名字通常就是“主模式名-hook”。例如，我们希望在主模式“文本文件模式”
text-mode 中启动次模式“检查拼写” flyspell-mode，可以这样进行配置： ::

    (add-hook 'text-mode-hook 'flyspell-mode)

这样当我们打开 txt 文件时，会自动开启检查拼写功能。text-mode 是基于文本的文件的一个主
模式，有一些其它主模式是由它派生，例如 html-mode。而相对的，还有编程模式 prog-mode，
各种编程语言对应的主模式都是由它派生，包括我们上文提到的 c++-mode 和 python-mode。那
么如果我们希望任何编程语言都有一些共同需要的功能，例如编程时我们希望有代码块折叠功能，
可以为 prog-mode-hook 挂上相应功能就行。 ::

    (add-hook 'prog-mode-hook #'hs-minor-mode)

窗口分割
--------

想要同时打开两个文件相互参照对比是一个再常见不过的需求，Emacs 自然可以做到。 ::

    C-x o       other-window                    将光标切换到下一个 Window
    C-x 0       delete-window                   关闭光标所在 Window
    C-x 1       delete-other-window             只保留光标所在 Window，关闭其它 Window。其它 Window 的
                                                Buffer 依然没有关闭，可以通过 "Buffer List" 查看
    C-x 2       split-window-below              上下分割出两个 Window
    C-x 3       split-window-right              左右分割出两个 Window
    C-x 4 f     find-file-other-window          在另一个窗口打开文件
    C-x 4 b     switch-to-buffer-other-window   在另一个窗口切换到另一缓冲
    C-x 4 d     dired-other-window              在另一个窗口打开目录
    C-M-v       scroll-other-window             第二个窗口向下翻页
    C-M-S-v     scroll-other-window-down        第二个窗口向上翻页
    C-x 5 2     make-frame-command              打开一个新 Frame
    C-x 5 f     find-file-other-frame           在另一个界面打开文件

分割后，默认会把当前的 Buffer 也显示到新 Window。再次强调一下，Buffer 对应真正打开的
文件，而 Window 是把 Buffer 显示出来的元件，所以一个文件只会开一个 Buffer，但可以有
多个 Window 显示。于是，在新的 Window 里用 C-x C-f 打开另一个文件即可看到两个文件了，
当然也可以正常用上面所说的 Buffer 切换。既然打开一个新的窗口并打开新的文件是很常见的需
求，对此如果只有以上快捷键，需要先 C-x 3 分割出一个窗口，C-x o 切换到新窗口，C-x C-f
打开新文件，过于繁琐。所以 Emacs 提供了一个快捷键：C-x 4 f 来达到“在另一个窗口打开新
的文件，如果只有一个窗口就分割成两个”的效果。

此外还有 C-x 4 b 表示“在另一个窗口切换到另一 Buffer，如果只有一个窗口就分割成两个” 。
C-x 4 d 表示 “在另一个窗口打开目录，如果只有一个窗口就分割成两个”。可以总结出 C-x 4
为前缀时，表达的是“在另一个窗口打开……”的意思。

在打开两个窗口时，如果我们光标在第一个窗口，而希望第二个窗口翻页，那么就可以用 C-M-v
向下翻页。用 C-M-S-v （同时按下 Control，Meta，Shift 和 v）向上翻页。

那么如果在已经分割之后再分割呢？Emacs 会继续做二等分，变成 3 个、4 个等窗口。此时窗口
的切换和关闭就没有那么方便了。通过插件 ace-window 可以辅助这一过程。

既然能多 Window，自然能多个 Frame。打开一个新的 Frame 可以使用快捷键 C-x 5 2。在一个
新的 Frame 打开文件，可以使用快捷键 C-x 5 f。C-x 5 和 C-x 4 基本类似，只是前者在
Frame 间操作，后者在 Window 间操作。笔者的日常使用中，对多文件的打开更偏爱在单个
Frame 中用多个 Window，很少在多 Frame 中间频繁切换。

Emacs Lisp
-----------

Emacs Lisp 发源于 Lisp，而 Lisp 就是 “List Processing“ 的缩写，顾名思义，Lisp 语言
的核心就是列表（List）。在 Lisp 中，每一对小括号表达了一个列表，列表元素用空格分隔。在
执行 Lisp 时，会把列表的第一个元素作为函数名，后面的元素都是函数的参数。元素可以是一个
“词”，也可以是另一个列表。

例如 2+3+4 在 Lisp 中写为 ``(+ 2 3 4)``，因为 + 就是个函数，后面是它的参数。再如
4+(3-2) 写为 ``(+ 4 (- 3 2))``。定义函数就用 defun 关键字，设置变量值用 setq 关
键字。以下展示的 Emacs Lisp 代码可以约等于下面的 C/C++ 代码： ::

    (defun set-prompt (caller prompt-fn)
        (setq prompts-list
            (plist-put prompts-list caller prompt-fn)))

    void set_prompt(Caller caller, Fn prompt_fn) {
        prompts_list = plist_put(prompts_list, caller, prompt_fn);
    }

另外有一些不起眼的字符在 Lisp 中也是有意义的，例如单引号表达了后面的元素不进行执行而直
接返回它本身。反引号（`）在 Lisp 中也有特别含义，和单引号类似。 ::

    '(Tom Amy John)     ; 包含三个元素的“数组”，而不是在执行一个叫 Tom 的函数
    'set-prompt         ; set-prompt 作为对象传递给其它部分，并不执行这个函数

Emacs Lisp 源码文件的后缀名是 .el。分号（;）以后的内容是注释。由于 Lisp 的整个语言结
构就是列表的嵌套，所以它设定了一个非常强大的宏系统，可以用代码生成代码，甚至定义出一个
与之前不太一样的新语言，常被称为方言。Emacs Lisp 就是这样诞生的。再加上其变量名可使用
的字符很多，所以读者如果发现了一些不同寻常的写法，不要觉得惊讶，也请记住 Lisp 的语法本
质始终都是列表。

值 t 表示 true，nil 表示 false。

配置文件
--------

* https://github.com/purcell/emacs.d
* https://github.com/nickav/naysayer-theme.el
* https://github.com/pixlark/JonathanBlowEmacsTheme
* https://github.com/rexim/dotfiles
* https://github.com/rexim/simpc-mode
* https://github.com/tsoding/cm
* https://magit.vc/manual/magit/

配置文件是一个包含了 Emacs Lisp 源码的文件，描述了 Emacs 应当以什么样的方式启动。在
Emacs 启动的时候会执行其中的代码，可以理解为启动时刻运行的脚本。当启动 Emacs 时，
Emacs 会自动依次寻找以下几个文件之一作为配置文件。在 Windows 系统上，Emacs 的 Home
目录是 C:\Users\<user-name>\AppData\Roaming\。 ::

    ~/.emacs
    ~/.emacs.el
    ~/.emacs.d/init.el
    ~/.config/emacs/init.el

将所有 Emacs 配置放在一个目录中可能会更方便，这种情况下应该使用 ~/.emacs.d/init.el
或与 XDG 兼容的 ~/.config/emacs/init.el。可以使用命令行开关 -q 来防止加载你的 init
文件，以及使用 -u（或 --user）来指定不同用户的 init 文件。

还可以有一个默认的 init 文件，即通过标准库搜索路径找到的名为 default.el 的库。Emacs
发行版中没有这样的库；你的站点可能会创建一个用于本地自定义的库。如果存在此库，除非指定
了 -q，否则每次启动 Emacs 时都会加载它。但是，你的 init 文件总是会首先被加载；如果将
inhibit-default-init 设置为非 nil，则不会加载 default 文件。

你可以将 default.el 和 site-start.el 放在 Emacs 搜索 Lisp 库的任何目录中。变量
load-path 指定了这些目录。许多站点将这些文件放在 Emacs 安装目录下的 site-lisp 子目录
中，例如 /usr/local/share/emacs/site-lisp。

你的站点也可能有一个站点启动文件；如果存在，该文件名为 site-start.el。与 default.el
一样，Emacs 通过标准的 Lisp 库搜索路径找到此文件。Emacs 在加载你的 init 文件之前加载
此库。要抑制加载此库，请使用 --no-site-file 选项。我们建议不要使用 site-start.el 进
行一些用户可能不喜欢的更改。将它们放在 default.el 中会更好，这样用户可以更容易地覆盖
它们。

不推荐对你的 init 文件进行字节编译（请参阅 Emacs Lisp 参考手册中的字节编译）。它通常
不会显著加快启动速度，而且当你忘记重新编译文件时，往往会引发问题。更好的解决方案是使用
Emacs 服务器来减少你启动 Emacs 的次数（请参阅将 Emacs 用作服务器）。如果你的 init 文
件定义了许多函数，考虑将它们移到一个单独的（已字节编译的）文件中，然后在你的 init 文件
中加载它。

大多数 Emacs 自定义应该放在正常的初始化文件中。然而，有时需要在正常初始化文件处理之前，
在 Emacs 启动期间使自定义生效。这些自定义可以放在早期初始化文件中，
~/.config/emacs/early-init.el 或 ~/.emacs.d/early-init.el。此文件在包系统和 GUI
初始化之前加载，因此你可以在其中自定义影响包初始化过程的变量，例如
package-enable-at-startup、package-load-list 和 package-user-dir。请注意，像
package-archives 这样的变量只影响新包的安装，而不会影响已安装包的可用性，因此可以在正
常的初始化文件中自定义。

我们不建议将可以保留在正常初始化文件中的自定义移入 early-init.el。这是因为早期初始化
文件在 GUI 初始化之前读取，因此与 GUI 功能相关的自定义在 early-init.el 中可能无法可
靠工作。相比之下，正常的初始化文件是在 GUI 初始化之后读取的。如果你必须在早期初始化文
件中有依赖于 GUI 功能的自定义，请将它们设置为在 Emacs 启动时运行的钩子，例如
window-setup-hook 或 tty-setup-hook。

根据 Emacs Lisp 的规范，所有的源码文件的开头最好写好 docstring，也就是一些关于这个文
件的说明，即使是 init.el 也不例外。按照习惯，三个分号开头的注释表示“节”，两个分号开头
的注释表示“段落”。一个分号开头的是一行代码后面的行内注释。 ``Code:`` 后面开始 Emacs
Lisp 的代码。同时，加上文件结尾的注释。 ::

    ;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
    ;;; Commentary:

    ;; This file bootstraps the configuration, which is divided into
    ;; a number of other files.

    ;;; Code:

    ;;; init.el ends here

require 命令可以导入并执行其他源码文件，例如我们可以创建一个文件
~/.emacs.d/lisp/hello.el，包含如下代码： ::

    ;;; hello -- Echo "Hello, world!"

    (defun hello-world ()
        (interactive)
        (message "Hello, world!"))

    (provide 'hello) ; 意为“导出本模块，名为 hello”

然后在 init.el 中添加以下代码，重启 Emacs，此时 Emacs 就会多了一条名为 hello-world
的命令。读者此时可以按下 M-x ，输入 hello-world，就可以看到回显区 Echo area 中出现了
"Hello, world!"。尽管这个函数不在 init.el 中定义，但通过这种方式导入就可以顺利执行成
功！(interactive) 这句代码意为“让这个函数可以通过 M-x 手动调用，否则按下 M-x 时会发
现找不到 hello-world 这个命令。没有 (interactive) 的函数不会对用户直接暴露，仅用于内
部调用。 ::

    (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; 添加文件加载路径
    (require 'hello)

常用函数： ::

    ;; Add a directory to the variable load-path. You can then put Lisp libraries that are not included with Emacs
    ;; in this directory, and load them with M-x load-library.
    (add-to-list 'load-path "/path/to/lisp/libraries")

    ;; Load the installed Lisp library named foo (actually a file foo.elc or foo.el in a standard Emacs directory)
    ;; When the argument to load is a relative file name, not starting with ‘/’ or ‘~’, load searches load-path
    (load "foo")
    (load "~/foo.elc")
    (load file-name-string)

    ;; Tell Emacs to find the definition for the function myfunction by loading a Lisp library named mypackage
    ;; (a file mypackage.elc or mypackage.el). Here the string "Do what I say." is the function’s documentation
    ;; string. You specify it in the autoload definition so it will be available for help commands even when the
    ;; package is not loaded. The last argument, t, indicates that this function is interactive; that is, it can
    ;; be invoked interactively by typing M-x myfunction RET or by binding it to a key. If the function is not
    ;; interactive, omit the t or use nil.
    (autoload 'myfunction "mypackage" "Do what I say." t)

一些基础设置： ::

    (setq confirm-kill-emacs #'yes-or-no-p) ; 在关闭 Emacs 前询问是否确认关闭，防止误触
    (electric-pair-mode t) ; 自动补全括号
    (add-hook 'prog-mode-hook #'show-paren-mode) ; 编程模式下，光标在括号上时高亮另一个括号
    (column-number-mode t) ; 在 Mode line 上显示列号
    (global-auto-revert-mode t) ; 当另一程序修改了文件时，让 Emacs 及时刷新 Buffer
    (delete-selection-mode t) ; 选中文本后输入文本会替换文本（更符合我们习惯了的其它编辑器的逻辑）
    (setq inhibit-startup-message t) ; 关闭启动 Emacs 时的欢迎界面
    (setq make-backup-files nil) ; 关闭文件自动备份
    (add-hook 'prog-mode-hook #'hs-minor-mode) ; 编程模式下，可以折叠代码块
    (global-display-line-numbers-mode 1) ; 在 Window 显示行号
    (tool-bar-mode -1) ; 熟练后可选，关闭 tool bar
    (when (display-graphic-p) (toggle-scroll-bar -1)) ; 图形界面时关闭滚动条
    (savehist-mode 1) ;（可选）打开 Buffer 历史记录保存
    (setq display-line-numbers-type 'relative) ;（可选）显示相对行号
    (add-to-list 'default-frame-alist '(width . 90)) ;（可选）设定启动图形界面时的初始 Frame 宽度（字符数）
    (add-to-list 'default-frame-alist '(height . 55)) ;（可选）设定启动图形界面时的初始 Frame 高度（字符数）

最后，配置文件的结尾要有一句： ::

    (provide 'init)

让配置生效，最简单的办法是重启 Emacs。此外，如果你在频繁的改一些配置，尤其是调整一些参
数等，频繁的重启很麻烦。事实上 Emacs Lisp 语言是逐句执行的。所以例如我们新加入了一段配
置，我们便可以直接选中这部分代码，然后按下 M-x eval-region，表达了“运行选中的这部分代
码”的含义，这样这段代码立刻就会生效了。当然，还有 M-x eval-buffer 可以直接重新执行当
前 Buffer 的所有代码。

自动配置
~~~~~~~~~

除了手动修改配置文件，Emacs 还提供了一种更为方便的办法来管理可配置变量（customizable
variables），或称为用户选项（user options）。最简单的进入方式是输入 M-x customize
命令。

变量是分组（group）管理的，只需要点进去寻找或搜索相关的变量就可以进行设置。对于每一个
变量，点左侧的箭头展开内容，可以看到有的变量是 Toggle 按钮表示可以设定 true/false，
有的则是取值列表，可以设定值。修改后，State 会显示已编辑。最后点击上方的 Apply 就是
应用更改。点击 Revert 可以放弃更改等。按 q 退出。

此外，使用 Emacs 的过程中也可以临时修改某个变量的值，M-x set-variable 可以输入变量
名、回车、输入值、回车实现修改。还可以用 C-h v 输入变量名来查看变量的帮助信息。

因此总的来说，想要设定变量有三种途径：手动修改配置文件 (setq name value)；customize
中设定；运行过程中临时修改 M-x set-variable。需要再强调一下的是一定要区分命令和变量。
这里笔者所指的 “命令” 是带有 (interactive) 的函数。例如上文举例的 hello-world 函数，
这种函数可以通过 M-x 输入函数名进行调用。命令是可以执行的，而变量只是保存一个值，不可
以执行。

以外观自动配置为例，Emacs 中掌管显示的专用名词是 Face，例如对文字来说，其字体、字号、
颜色、背景都称为Face。想要配置 Face，输入命令 M-x customize-face 然后输入相应的 Face
名称即可自定义。例如，我们想更改光标的颜色，可以输入 cursor（或通过 M-x customize
-> Faces -> Basic Faces -> Cursor 进入）。当前界面下所有的 Face 的名字及颜色可以在
界面中输入 M-x list-faces-display 列出。

“Cursor face:” 后面一块矩形是 Emacs 中光标方块的颜色。下面的 “State” 表示这个 Face
是被谁设置了， “THEMED” 表示光标颜色由主题指定；如果从未配置会显示 “STANDARD”，即
“标准”，也就是默认的标准颜色。再下面是一段对这个 Face 的介绍。最后是可以配置的属性
（Attribute），属性有很多，但只展示配置过的属性，对于 Cursor 来说，主要就是背景颜色，
所以这里显示了 “Background”。点 “Choose” 就会列出一系列颜色供用户选择。点 “Show All
Attributes” 可以列出所有属性，包括字体、字号、加粗、斜体等等（但对 Cursor 来说别的属
性没有意义，所以这里修改别的也没有用）。最后，点上方的 “Apply”就是应用当前的设置预览
效果，但不保存设置；点 “Apply and Save” 就是应用并保存了。

在使用命令行 Emacs 时，可能并没有很多可以选择的颜色，这很可能是因为读者所使用的终端不
支持显示很多颜色。建议读者首先使用较为现代的终端程序，并且打开其中的色彩选项，例如
“xterm-256” 之类的。

当设置的变量保存后，Emacs 会自动将一些配置代码加入到 init.el 配置文件的末尾，或是加入
到自定义的配置文件中（custom-file），类似： ::

    (custom-set-variables
     ;; custom-set-variables was added by Custom.
     ;; If you edit it by hand, you could mess it up, so be careful.
     ;; Your init file should contain only one such instance.
     ;; If there is more than one, they won't work right.
     (custom-set-faces
      ;; custom-set-faces was added by Custom.
      ;; If you edit it by hand, you could mess it up, so be careful.
      ;; Your init file should contain only one such instance.
      ;; If there is more than one, they won't work right.
      ; 一些 Face 配置
    ))

正如注释中所言，这段代码是由 Emacs Custom 系统自动维护的，读者轻易不要手动修改，否则
会导致混乱。Custom 如此修改初始化文件，把初始化文件弄的不美观了；或者如果用户有时候在
本机使用图形界面 Emacs，有时候在服务器上使用命令行 Emacs，二者希望进行不同的 Custom
设置但又不想维护两组 Emacs 配置，该如何操作呢？

事实上可以配置这个文件，比如建文件 ~/.emacs.d/custom.el，把上方的代码块完全剪切到其
中，然后在初始配置文件如 ~/.emacs.d/init.el 中写入： ::

    (setq custom-file "~/.emacs.d/custom.el")
    (load custom-file)

这里将变量 custom-file 改成我们自定义的文件名，然后加载这个文件，即可让 Custom 不再
干扰我们的 ~/.emacs.d/init.el 文件，而把改动都写入 ~/.emacs.d/custom.el。还可以比
如新建一个 ~/.emacs.d/lisp/init-theme.el 文件，把这两句代码写进去，然后在
~/.emacs.d/init.el 中 require 导入。 ::

    (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory)) ; 添加文件加载路径
    (require 'init-theme)

对于想要区分多个场景下的 Custom 配置，可以参考如下 init-theme.el 的配置： ::

    (setq custom-nw-file (expand-file-name "custom-nw.el" user-emacs-directory))
    (setq custom-ui-file (expand-file-name "custom-ui.el" user-emacs-directory))

    (if (display-graphic-p)
        (progn
            (setq custom-file custom-ui-file)
            ; (add-to-list 'default-frame-alist '(ns-appearance . dark)) ; macOS 下让窗口使用暗色主题
            ;; other settings
        )
        (progn
            (setq custom-file custom-nw-file)
            ;; other settings
        ))

    (load custom-file)

如此在图形界面时使用 ~/.emacs.d/custom-ui.el 而在命令行时使用
~/.emacs.d/custom-nw.el。

Emacs 会将 user-emacs-directory 设置为它决定使用的目录。此目录随后用于查找你的其他
用户特定的 Emacs 文件，例如 custom-file（Saving Customizations）、the saved
desktop（Saving Emacs Sessions）等。命令行选项 --init-directory 会覆盖上述在查找
你的用户初始化文件过程中确定的 user-emacs-directory 的值。

In the customization buffer, you can save a customization setting by choosing
the ‘Save for Future Sessions’ choice from its ‘[State]’ button. The C-x C-s
(Custom-save) command, or the ‘[Apply and Save]’ button at the top of the
customization buffer, saves all applicable settings in the buffer.

Saving works by writing code to a file, usually your initialization file.
Future Emacs sessions automatically read this file at startup, which sets up
the customizations again.

你可以选择将自定义设置保存到你的初始化文件之外的其他位置。为此，你必须在你的初始化文件
中添加几行代码，以设置变量 custom-file 为你想要的文件名，并加载该文件。你甚至可以为不
同的 Emacs 版本指定不同的自定义文件，例如： ::

    (cond
        ((< emacs-major-version 28)
            ;; Emacs 27 customization
            (setq custom-file "~/.config/custom-27.el"))
        ((and (= emacs-major-version 26) (< emacs-minor-version 3))
            ;; Emacs 26 customization, before version 26.3
            (setq custom-file "~/.config/custom-26.el"))
        (t  ;; Emacs version 28.1 or later
            (setq custom-file "~/.config/emacs-custom.el")))
    (load custom-file)

If Emacs was invoked with the -q or --no-init-file options, it will not let you
save your customizations in your initialization file. This is because saving
customizations from such a session would wipe out all the other customizations
you might have on your initialization file. Please note that any customizations
you have not chosen to save for future sessions will be lost when you terminate
Emacs. If you’d like to be prompted about unsaved customizations at termination
time, add the following to your initialization file: ::

    (add-hook 'kill-emacs-query-functions
        'custom-prompt-customize-unsaved-options)

配置快捷键
----------

使用以下函数可以配置自己的全局快捷键： ::

    (global-set-key (kbd <KEY>) <FUNCTION>)

其中 <KEY> 和 <FUNCTION> 替换为你想要设置的快捷键和功能。<FUNCTION> 如果设成 nil 相
当于解绑快捷键的设定。例如： ::

    (global-set-key (kbd "RET") 'newline-and-indent) ; 修改回车键为“新起一行并做缩进”
    (global-set-key (kbd "M-w") 'kill-region) ; 交换 M-w 和 C-w，M-w 为剪切
    (global-set-key (kbd "C-w") 'kill-ring-save) ; 交换 M-w 和 C-w，C-w 为复制
    (global-set-key (kbd "C-a") 'back-to-indentation) ; 交换 C-a 和 M-m，C-a 为到缩进后的行首
    (global-set-key (kbd "M-m") 'move-beginning-of-line) ; 交换 C-a 和 M-m，M-m 为到真正的行首
    (global-set-key (kbd "C-c '") 'comment-or-uncomment-region) ; 为选中的代码加注释/去注释
    (defun prev-ten-lines()
        "Move cursor 10 lines backward"
        (interactive)
        (previous-line 10))
    (defun next-ten-lines()
        "Move cursor 10 lines forward"
        (interactive)
        (next-line 10))
    (global-set-key (kbd "M-p") 'prev-ten-lines) ; 光标向前移动 10 行
    (global-set-key (kbd "M-n") 'next-ten-lines) ; 光标向后移动 10 行
    (global-set-key (kbd "C-j") nil) ; 解绑本来的 C-j 快捷键，让其也成为了一个前缀
    ;; 删去光标所在行（在图形界面时可以用 "C-S-<DEL>"，终端常会拦截这个按法)
    (global-set-key (kbd "C-j C-k") 'kill-whole-line)

插件和包管理
------------

Emacs 的插件都被放在了一些固定的仓库网站上，就好像手机的应用商店一样，区别是 Emacs 所
使用的仓库是可以自由配置的，我们只需要把仓库的地址告诉 Emacs 就可以了。Emacs 最大的插
件仓库是 MELPA，此外也有一个默认仓库 GNU ELPA。

* https://elpa.gnu.org/packages/index.html
* https://elpa.nongnu.org/nongnu/
* https://melpa.org/#/getting-started

只需以下几行配置代码，就可以把仓库地址 https://melpa.org/packages/ 存储到
package-archives 列表中，并命名为 “melpa”。 ::

    (require 'package)
    (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
    ;; Comment/uncomment this line to enable MELPA Stable if desired. See `package-archive-priorities`
    ;; and `package-pinned-packages`. Most users will not need or want to do this.
    ;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
    (package-initialize)

由于国内网络问题，直接访问速度较慢，可以使用腾讯镜像。腾讯镜像中，除了 MELPA，第一条的
"gnu" 对应着的就是默认的 GNU ELPA，部分包是只在 GNU ELPA 上的。这里的配置意为：设置
两个插件仓库，一个叫 gnu，一个叫 melpa。 ::

    (require 'package)
    (setq package-archives
      '(("gnu" . "http://mirrors.cloud.tencent.com/elpa/gnu/")
        ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")))
    (package-initialize)

随后重启 Emacs 后，输入命令 package-list-packages 就可以列出来仓库中的所有插件，可以
选中相应的插件，会弹出介绍的界面和安装按钮。此外，还可以直接通过命令 package-install，
按下回车后，输入插件名就可以安装相应插件。

package-list-packages 列表界面下，可以按 h 显示帮助，提示怎样操作包列表。默认情况下，
插件会被安装到 ~/.emacs.d/elpa/ 目录下。想要删除已安装的插件，输入命令
package-delete，然后输入已安装的插件名即可。

通常各种插件都会发布到 GitHub 上，一般在上面都会介绍如何配置这个插件。但插件逐渐多了我
们会发现，不同插件的使用、配置常常不同，一一配置会使得配置文件很乱，且不易管理，并且缺
少一些自动化的配置机制。

可以使用一个方便的插件 use-package 来进行管理。use-package 是一个默认可用的代码包，
源代码位于 Emacs 安装目录下的 share\emacs\<version>\lisp\use-package 中。在启动
Emacs 的时候首先加载 use-package 插件，随后我们再使用 use-package 插件来管理所有其
它插件。 ::

    ;; This is only needed once, near the top of the file
    (eval-when-compile
        (require 'use-package))

use-package 的用法可参考帮助文档，以下是一些简单用法： ::

    (use-package foo    ; 加载代码包 foo，前提是该代码包已经安装在你的系统上
        :ensure t       ; 如果添加了这行代码，没有安装的话会自动根据ELPA仓库进行安装
        :init           ; init 关键字指定在代码包加载之前执行的代码
        (setq foo-variable t)
        :config         ; config 关键字指定在代码包加载之后执行的代码
        (foo-mode 1)
        :bind           ; 绑定快捷键，可以接收一个 cons 或一个列表（conses）
        (("M-o r" . highlight-regexp)
         ("M-o w" . highlight-phrase)))

一个插件代码包，可以使用 package-install 进行安装，或使用 use-package 的 :ensure
关键字自动安装。常用插件列表： ::

    https://github.com/DarwinAwardWinner/ido-completing-read-plus
    ido amx 全方位文本补全和M-x补全

    https://github.com/abo-abo/ace-window
    ace-window 方便多窗口切换

    https://github.com/alezost/mwim.el
    mwim 方便行首尾的光标移动

    https://www.emacswiki.org/emacs/UndoTree
    https://www.dr-qubit.org/undo-tree.html
    undo-tree 显示文本编辑历史树方便撤销操作

    https://github.com/justbur/emacs-which-key
    which-key 快捷键提示，按 C-h 然后 n/p 可以翻页

    https://github.com/abo-abo/avy
    https://karthinks.com/software/avy-can-do-anything/
    avy 光标快速跳转

    其操作逻辑的抽象概念，也是很多 Emacs 命令使用的逻辑：Filter（筛选）、Select
    （选择）、Act（行动）。举个例子，我们按 C-x C-f 打开文件，此时列出了当前目录下
    所有文件名，按下文件名的前缀，待选文件的范围就会缩小；我们在其中最终选择了一个
    文件；最后按下回车，此时 Emacs 就会打开并切换到那个文件。

    事实上，当我们筛选后、选择前，还可以更改 avy 的行动，有哪些行动呢？读者可以输入
    部分文本后，按下 ? 键，就会显示出 avy 当前支持的行动。包括：
    Y: yank-line    粘贴行
    X: kill-stay    隔空剪切文本
    t: teleport     把远处的文本传送到当前位置
    avy-copy-line avy-move-line avy-copy-region avy-move-region

    https://github.com/abo-abo/hydra
    https://github.com/abo-abo/hydra/wiki
    hydra 把一组特定场景的命令组织到一起，通过简单按键来进行调用。

    (defhydra hydra-awesome (awesome-map awesome-binding awesome-plist)
        awesome-docstring
        awesome-head-1
        awesome-head-2
        awesome-head-3
        ...)

    (defhydra hydra-zoom (global-map "<f2>")
        "zoom"
        ("g" text-scale-increase "in")
        ("l" text-scale-decrease "out"))

    hydra-awesome: 如果给你的 hydra 命名为 hydra-awesome，defhydra 会返回结果 hydra-awesome/body
    awesome-map: global-map
    awesome-binding: "<f2>"
    awesome-plist 可以是：
        :pre (set-cursor-color "#40e0d0") ; 每个 head 运行之前执行
        :post (progn (set-cursor-color "#ffffff") (message "Thank you, come again.")) ; body 之后执行
        :exit 其值被每个 head 继承，但 head 可以继续设置自己的值，该值影响 head 在执行完命令之后是否退出 hydra
            nil     默认值，hydra state 将会继续
            t       hydra state 将会退出
        :foreign-keys 其值属于 body，决定着在按一个不属于任何 head 关联的快捷键之后会做什么
            nil     默认值，退出 hydra
            warn    不会退出 hydra，报警告消息并且不会执行这个 foreign key
            run     不会退出 hydra，并且尝试执行这个 foreign key
        :color 是一个快捷方式，等价于将 :exit 和 :foreign-keys 组合一起使用，并且 head 会显示对应的颜色
            red      两个都是默认值 - head 执行完命令继续，按未知快捷键退出
            amaranth :foreign-keys warn 另一个是默认值 - head 执行完命令继续，按未知快捷键警告
            pink     :foreign-keys run 另一个是默认值 - head 执行完命令继续，按未知快捷键尝试运行该快捷键
            teal     :foreign-keys warn :exit t - head 执行完命令退出，按未知快捷键警告
            blue     :exit t 另一个是默认值 - head 执行完命令退出，按未知快捷键退出
        :timeout 启动一个对应秒数的计时器，时间到就会退出 hydra，但调用任何 head 会重新刷新计时器
        :hint 其值被每个 head 继承，但 head 可以继续设置自己的值，只有一个有意义的值 :hint nil
        :bind 提供一个 lambda 为每个 head 绑定键，每个 head 可以设置自己的 :bind key，这样可让一些 head 不绑定避免暴露到 hydra 之外
        :base-map Use this option if you want to override hydra-base-map for the current hydra.
    awesome-docstring 可以是一个简单字符串，或者字符串以换行符开始会启用键高亮和 Ruby 风格的字符串插值。
        * 要高亮一个键，只需用下划线将其包裹起来。注意，该键必须属于某个头部之一。该键将根据其行为以适当的
          颜色高亮显示，也就是说，如果按键会使 Hydra 退出，颜色将是蓝色。
        * 要插入一个空字符，使用 ^。它的唯一用途是让你的代码和结果一样整齐。
        * 要插入一个动态的 Elisp 变量，使用 % 后跟变量名。每当变量被 head 修改时文档字符串就会更新。可以
          使用格式化样式的宽度说明符。
        * 要插入一个动态的 Elisp 表达式，例如 %(length (dired-get-marked-files))。如果一个头部会改变
          标记文件的数量，它就会被更新。
        * 如果 Elisp 表达式的结果是一个字符串，并且你不想引号引用，使用这种形式：
          %s(shell-command-to-string "du -hs")，这里动态显示磁盘使用情况。
    awesome-head 的组成：(head-binding head-command head-hint head-plist)，例如上例中
        head-binding: "g"
        head-command: text-scale-increase，可以是一个函数、lambda、单个 sexp，或可设成 nil 表示退出 hydra
        head-hint: "in"，如果不显示命令提示字符串可设为 nil
        head-plist: nil，在 head 中可以覆盖的属性列表元素可以是 :exit :color :bind :column

    :column 是一个字符串，用于按类别对头部进行分组。如果未定义此属性，则头部将继承前一个头部的类别。如果前面
    头部都没有定义类别，则默认为 nil。当 Hydra 被实例化时，会生成一个文档字符串，将具有非空提示的相同类别的
    头部按列排列。没有类别的头部（:column 值为 nil）将被安排在表格下方的一行中，或者如果 awesome-plist 指定
    了 :columns <n> 属性（表示未分类别的头部排成几列），则会被安排在第二个表格中。此外，一个列名可以在任何头
    部中出现多次。

    https://github.com/magnars/multiple-cursors.el
    multiple-cursors 多光标编辑，该插件提供了多种生成多光标的方式。该代码包依赖于 cl-lib 代码包。
    The package depends on the cl-lib package, cl-lib is common lisp extensions for emacs, it is a built-in package.
    1. 连续多行 - 我们按下 C-SPC 触发一次 set-mark，随后让光标向下移动，再输入 M-x mc/edit-lines 就生成连续多行光标。
    2. 编辑多处同一段文本 - 选中文本，输入命令 mc/mark-next-like-this、mc/mark-previous-like-this、
       mc/mark-all-like-this，看名字就知道，分别可以标记下一个词、上一个词、所有词。还可以用
       mc/skip-to-next-like-this 和 mc/skip-to-previous-like-this 跳过一部分。
    3. 鼠标点击选择 - 见配置，将 mc/toggle-cursor-on-click 绑定到某个键位。比如使用的是 Ctrl + Shift + 鼠标左键。

    (use-package multiple-cursors
        :ensure t
        :after hydra
        :bind
        (("C-x C-h m" . hydra-multiple-cursors/body)
         ("C-S-<mouse-1>" . mc/toggle-cursor-on-click))
        :hydra (hydra-multiple-cursors (:hint nil)
        "
        Up^^       Down^^      Miscellaneous      % 2(mc/num-cursors) cursor%s(if (> (mc/num-cursors) 1) \"s\" \"\")
        ------------------------------------------------------------------
        [_p_]  Prev   [_n_]  Next   [_l_] Edit lines [_0_] Insert numbers
        [_P_]  Skip   [_N_]  Skip   [_a_] Mark all  [_A_] Insert letters
        [_M-p_] Unmark  [_M-n_] Unmark  [_s_] Search   [_q_] Quit
        [_|_] Align with input CHAR    [Click] Cursor at point"
        ("l" mc/edit-lines :exit t)
        ("a" mc/mark-all-like-this :exit t)
        ("n" mc/mark-next-like-this)
        ("N" mc/skip-to-next-like-this)
        ("M-n" mc/unmark-next-like-this)
        ("p" mc/mark-previous-like-this)
        ("P" mc/skip-to-previous-like-this)
        ("M-p" mc/unmark-previous-like-this)
        ("|" mc/vertical-align)
        ("s" mc/mark-all-in-region-regexp :exit t)
        ("0" mc/insert-numbers :exit t)
        ("A" mc/insert-letters :exit t)
        ("<mouse-1>" mc/add-cursor-on-click)
        ;; Help with click recognition in this hydra
        ("<down-mouse-1>" ignore)
        ("<drag-mouse-1>" ignore)
        ("q" nil)))

    ;; https://github.com/nschum/highlight-symbol.el
    ;; highlight-symbol 高亮出当前 Buffer 中所有的、与光标所在处的符号相同的符号
    (use-package highlight-symbol
        :ensure t
        :init (highlight-symbol-mode)
        :bind ("<f3>" . highlight-symbol)) ;; 按下 F3 键就可高亮当前符号

配置主题
--------

* https://emacsthemes.com/
* https://github.com/topics/emacs-theme
