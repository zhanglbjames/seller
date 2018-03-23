# 内容销售系统

### R1展示（首页）
- [checked]R1.1系统的基本界面为卖家所有内容的展
- [checked]R1.1.1系统的细节为内容的标题、图片和价格
- [checked]R1.2买家登陆后，界面显示用户昵称，有退出、财务、购物车三个功能按钮
- [checked]R1.3买家登陆后，已购买的内容上有特殊标示表明已购买系统有两类用户，买家和卖家，系统只有一个卖家和一个买家，用户的账号由后台直接注入，不由本系统的功能来注册和维护。卖家可以发布内容，为内容定价，查看购买情况。买家可以浏览已发布的内容摘要，选择购买，查看已购买的内容
- [checked]R1.4买家登陆后，可以只查看未购买的内容，
- [checked]R1.5卖家登陆后，展示界面显示用户昵称，有退出，发布两个功能按钮
- [checked]R1.6卖家登陆后，已出售的内容上有数字表明已出售的数量
- [checked]R1.7卖家登陆后，可以在展示界面删除未出售的内容

### R2登陆
- [checked]R2.1用户登陆时，需要输入用户名和密码，前端密码用MD5加密后传输
- [checked]R2.2登陆后，所有界面上要显示用户的昵称和购物车图标（按钮）

### R3查看点击展示中的每个内容的网格，进入查看界面，可以查看内容
- [checked]R3.1买家对于没有购买的内容，看到的是标题、摘要文字、当前的价格、购买按钮、全文
- [checked]R3.2买家对于已经购买的内容，看到的是标题、摘要文字、购买时的价格、购买不可用、全文
- [checked]R3.3卖家看到的是标题、摘要文字、价格、全文、编辑按钮

### R4购买
- [checked]R4.1在查看界面点击购买按钮，弹出确认窗口
- [checked]R4.2点击确认按钮就将内容放入了购物车
- [ConflictAndIgnore]R4.3用户已经购买过的内容可以重复购买

### R5结算
- [checked]R5.1在任何页面上点击购物车的图标（按钮）进入结算页面
- [checked]R5.2结算页面列出购物车中全部内容，包括    1、标题    2、价格    3、数量
- [checked]R5.3结算页面只有退出和购买两个按钮
- [checked]R5.4点击购买按钮则购买购物车内的全部内容
- [checked]R5.5点击退出按钮则回到进入结算页面之前的页面

### R6账务
- [checked]R6.1在展示界面点击“财务”按钮，进入财务界面
- [checked]R6.2在财务界面以列表的方式列出而所有已购买的内容，每一项内容列出    1、标题    2、图片    3、购买的时间    4、购买的价格    5、购买的数量
- [checked]R6.3列表的最后计算出总的金额

### R7发布
- [checked]R7.1卖家在展示界面点击”发布“按钮，进入发布界面
- [checked]R7.2在发布界面可以输入内容的标题、摘要、图片、正文和价格，点击发布按钮即发布回到查看页面。

### R8内容的编辑
- [checked]R8.1卖家在查看界面可以点击编辑按钮进入编辑页面
- [checked]R8.2可以修改内容的全部细节：标题、摘要、图片、正文和价格，单机提交后回到查看界面

### BUG
1. [checked]主页显示不出已售数量（商家和未登录用户），已登录buyer可以看到
2. [checked]购物车结算只能结算一单