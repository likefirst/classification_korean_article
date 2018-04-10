# Classification Korean Article

## 소개

> 이 프로젝트는 [Text Understanding from Scratch](https://arxiv.org/pdf/1502.01710.pdf) 논문을 참조하여 만들었다.  
> 또한, Git hub에 올려져있는 [Code](https://github.com/zhangxiangxiao/Crepe)를 기반으로 진행됐다.

이 프로젝트는 **기사의 첫 문단을 보고 어떤 카테고리에 속하는 지 분류하는 문제**를 해결하고자 한다.  
카테고리는 총 5가지(`정치`, `사회`, `경제`, `스포츠`, `엔터테이먼트`)로 분류한다.

방법론은 참조 논문을 기반으로 하되, 한국어에 더 최적화된 방법을 추가로 진행했다.  
총 3가지 방법을 실험하였다.

1. 기존 방법 (method1)
2. 구분자를 두어 양자화하는 방법 (method2)
3. 순서를 2진법으로 양자화하는 방법 (method3)

각 방법의 구체적인 설명은 [여기](https://github.com/likefirst/classification_korean_article/blob/master/%EC%9D%B4%EB%AF%B8%EC%A7%80%20%EA%B8%B0%EB%B0%98%EC%9D%98%20%ED%95%9C%EA%B5%AD%EC%96%B4%20%ED%85%8D%EC%8A%A4%ED%8A%B8%20%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0_last.ver.pdf)를 참조하면 된다.
