1. 创建 Spring mvc 工程
2. 导入 /wec|/src|pom.xml （同级目录）
3. pom.xml 右键选择 Maven
4. .iml 文件中 
  <webroots> 替换为 
	<webroots>
    		<root url="file://$MODULE_DIR$/web" relative="/" />
	</webroots>
  
5. FileUploadController 中两个path设置成自己电脑存储课件的路径