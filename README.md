网络应急化教育平台
----------------------------------------------------------------------------
	移民手册
	1. 创建 Spring mvc 工程
	2. 导入工程文件（src/web/pom.xml）
	3. 原工程中 web.xml 替换为 本项目 web.xml
	3. 使用 pom.xml 配置 Maven
	4. .iml 文件中 
  		<webroots> 替换为 
		<webroots>
    			<root url="file://$MODULE_DIR$/web" relative="/" />
		</webroots>
	5. FileUploadController 中三个path设置成自己电脑存储课件的路径
	
contact: friedchickenkai@gmail.com

