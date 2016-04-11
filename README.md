# iOSAnimation  
以前写了很多动效，不过没有系统的整理一下，最近正在准备动画相关的课程，刚好趁这个机会收集以前写的零零散散的效果。现在主要是集中在了BasicAnimation这块。后续会慢慢完善。
## CAAnimation  

view层的动画就不多说了。网上相关的例子很多。主要讲讲Layer层的动画。  
先来说下CAAnimation的优点。  

* 可交互性  
	* UIViewAnimation执行的时候无法响应时间，这个应该大家都知道。所以涉及到可交互动画的时候一般都使用的是CAAnimation 
* 可以pause，resume。  
	* 可以随时暂停，继续动画。这个UIViewAnimation应该也是做不到的  
* 实现的效果多样。  
	* 认真挖掘的话，可以玩的花样非常非常多，相比较而言，UIViewAnimation能够实现的效果就比较单一了。  
总结完了，我们来深入了解一下。  

## 第一部分CABasicAnimation  
先看初始化方法。  
`[CABasicAnimation animationWithKeyPath:keyPath];`
苹果官方文档有这么一段。  
![](http://7xi4jm.com1.z0.glb.clouddn.com/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7%202016-04-10%20%E4%B8%8B%E5%8D%888.58.32.png)  
其实只要是CALayer的这些属性，都可以当做keypath来进行动画。 
那么我们来看看生成一个CABasicAnimation需要设置哪一些属性呢？    
直接来看一段简单的动画代码。  

```

	NSValue *fromValue = [NSValue valueWithCGPoint:self.view.center];
  	NSValue *toValue = [NSValue valueWithCGPoint:CGPointZero];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.duration = 5;
    animation.fromValue = fromValue;
    animation.toValue = toValue;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBackwards;
    animation.beginTime = CACurrentMediaTime() + 1;
    [redView.layer addAnimation:animation forKey:@"positionAnimation"];  
```  
* duration: 动画的持续时长  
* fromValue: 动画的初始值  
* toValu:： 动画的结束值  
* removeOnCompletion: 动画结束时是否自动移除，如果设置了Yes，那么你需要手动给layer赋值。否则layer会自动回到动画开始之前的状态。  
* fillMode: 填充模式。这个有4种，我们后面细讲,其中需要注意的一点是，fillMode只会在`removeOnCompletion`设置为No的时候才会生效。。  
* beginTime: 动画的开始时间，这个需要注意的是，如果你需要在5s之后执行动画，并不能简单的直接赋值。而是需要`CACurrentMediaTime() + 5`这样来设置。

这里详细讲讲FillMode这个参数。 
iOS提供的默认kCAFillMode一共有四种 
> kCAFillModeRemoved 这个是默认值,也就是说当动画开始前和动画结束后,动画对layer都没有影响,动画结束后,layer会恢复到之前的状态 

> kCAFillModeForwards 当动画结束后,layer会一直保持着动画最后的状态 

> kCAFillModeBackwards 这个和kCAFillModeForwards是相对的,就是在动画开始前,你只要将动画加入了一个layer,layer便立即进入动画的初始状态并等待动画开始.你可以这样设定测试代码,将一个动画加入一个layer的时候延迟5秒执行.然后就会发现在动画没有开始的时候,只要动画被加入了layer,layer便处于动画初始状态 

>kCAFillModeBoth 理解了上面两个,这个就很好理解了,这个其实就是上面两个的合成.动画加入后开始之前,layer便处于动画初始状态,动画结束后layer保持动画最后的状态.

如果看完还是不理解。Demo里的`FillModeViewController`文件是示例。  

## CAKeyframeAnimation  

Demo里的动画有这些。  
![](http://7xi4jm.com1.z0.glb.clouddn.com/animationCollection.gif)


