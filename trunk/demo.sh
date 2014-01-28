#!/bin/sh
ln -s -f /Library/Frameworks/Awesomium.framework .
export LIB=./lib
export DYLD_LIBRARY_PATH=$LIB/macosxuniversal
#JAVA=/Library/Java/JavaVirtualMachines/jdk1.7.0_17.jdk/Contents/Home/bin/java
JAVA=java 
JNI_OPTS=-Xcheck:jni -Xverbose:jni
$JAVA -server $JNI_OPTS -XX:+UseConcMarkSweepGC -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n -Df3.jogl.stage.debug.draw=false -Df3.jogl.stage.debug.meshes=false -Dapple.awt.graphics.UseQuartz=true -Df3.jogl.stage.enable.textured.text=false -Df3.debug.anim=false -d32 -Xmx1G -Xbootclasspath/p:lib/jsr166.jar -classpath ${LIB}/f3c.jar:${LIB}/js.jar:${LIB}/jogl-all.jar:${LIB}/gluegen-rt.jar:${LIB}/jogl-cg.jar:${LIB}/f3.svg.awt.jar:${LIB}/f3.xhtml.awt.jar:${LIB}/core-renderer.jar:${LIB}/f3.awesomium.jogl.jar:${LIB}/f3.cg.jogl.awt.jar:${LIB}/org.f3.media.video.corevideo.jar:build/classes:${LIB}/json-simple-1.1.1.jar:${LIB}/org.f3.media.audio.impl.fmod.jar org.f3.runtime.Main expr.Main $*