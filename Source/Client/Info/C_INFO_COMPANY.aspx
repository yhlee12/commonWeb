<%@ Page Title="" Language="C#" MasterPageFile="~/Source/Client/Web.Master" AutoEventWireup="true" CodeBehind="C_INFO_COMPANY.aspx.cs" Inherits="T2LHomePage.Source.Client.Info.C_INFO_COMPANY" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @charset "utf-8";
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;400;500;700&display=swap');
*{margin: 0;padding: 0;font-family: 'Noto Sans KR', sans-serif;}
html,body{font-size:12px;font-family: 'Noto Sans KR', sans-serif;scroll-behavior: smooth;word-wrap: break-word;
word-break: keep-all;}
h1,h2,h3,h4,h5,h6{font-size: 100%;}
ol,ul{list-style:none;}
a{text-decoration: none;color:inherit;}
img{vertical-align: bottom; width:100%; height:100%; object-fit:cover; border-radius:6px;}
address{font-style: normal;}
table{border-collapse:collapse;}
button{border:none;background: transparent;font-size: 100%;color:inherit;cursor: pointer;margin: 0;}

#wrap {
  width: 100%;

}

.align {
  max-width: 2560px;
  margin: auto;
}

.organization {


  width: 100%;
  height: auto;
  padding: 80px 20px;
  box-sizing: border-box;

}
.organization .chart {
  max-width: 1134px;
  margin: auto;
}
.org1{
    width: 140px;
    height: 140px;
    border-radius: 100%;
    background: #f3d49c;
    margin: auto;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
}

.org1-1{
    width: 120px;
    height: 120px;
    border-radius: 100%;
    background: #e9b362;;
    margin: auto;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
}

.org1-2{
    width: 80px;
    height: 80px;
    border-radius: 100%;
    background: #ffffff;
    margin: auto;
    position: absolute;
    border: 2px solid #ef8e2e;
}


.organization .chart .org1::after{
  content: "";
  position: absolute;
  bottom: -75px;
  left:68px;
  width: 2px;
  height: 30px;
  background:#e1e1e1;

}
.organization .chart .org1::before{
  content: "";
  position: absolute;
  bottom: -166px;
  left:-215px;
  width: 555px;
  height: 2px;
  background: #e1e1e1;

}
.organization .chart .org1 h3{
  font-size: 20px;
  font-weight: 500;
  color: black;
  line-height: 80px;
  text-align: center;
}
.organization .chart .org-box{
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-top: 50px;
}
.organization .chart .org2{
   width: 80px;
    height: 80px;
    border-radius: 100%;
    margin: auto;
    background: #ffffff;
    margin: auto;
    position: absolute;
    border: 2px solid #ef8e2e;
}


.org2-1 {
    width: 120px;
    height: 120px;
    border-radius: 100%;
    background: #e9b362;;
    margin: auto;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
}

.org2-2 {
    width: 140px;
    height: 140px;
    border-radius: 100%;
    background: #f3d49c;
    margin: auto;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
}

.organization .chart .org2::before{
  content: "";
  position: absolute;
  top:-50px;
  left: -238px;
  width: 100px;
  height: 180px;
  border-top:2px solid #e1e1e1;
  border-right:2px solid #e1e1e1;
  border-bottom:2px solid #e1e1e1;

}
.organization .chart .org2::after{
  content: "";
  position: absolute;
  top:-50px;
  right: -235px;
  width: 100px;
  height: 180px;
  border-top:2px solid #e1e1e1;
  border-left:2px solid #e1e1e1;
  border-bottom:2px solid #e1e1e1;
}

.organization .chart .org2 h3{
  width: 100%;
  height: 100%;
  border-radius: 100%;
  font-size: 20px;
  font-weight: 500;
  color: red;
  line-height: 80px;
  text-align: center;
  cursor: pointer;
}
.organization .chart .org2 h3:hover,
.organization .chart .org2 h3:focus,
.organization .chart .org2 h3:active{

  background: #fff;
}
.organization .chart .org3-box{
  display: inline-flex;
  flex-direction: column;

}

.organization .chart .org3{
  width: 224px;
  height: 50px;
  border-radius: 10px;
  background: #fff;
  border: 1px solid #ef8e2e;
  display: inline-block;
  padding: 0 20px;
  box-sizing: border-box;
  position: relative;
  cursor: pointer;
  z-index: 99;
  
}
.organization .chart .org3+.org3 {
  margin-top: 40px;
}


.organization .chart .org3 h4{
  font-size: 16px;
  font-weight: 500;
  color: #000;
  line-height: 48px;
  letter-spacing: -1px;
  text-align: center;
}
.organization .chart .org3:hover,
.organization .chart .org3:active,
.organization .chart .org3:focus{
  background: #ef8e2e;
  border: 1px solid #ef8e2e;
}
.organization .chart .org3:hover h4,
.organization .chart .org3:active h4,
.organization .chart .org3:focus h4{
  color: #fff;
}

.organization .list-all {
  position: relative;
  max-width: 1200px;
  height: 0px;
  box-sizing: border-box;
  margin: auto;
  overflow: hidden;
}
.organization .list-all.list-all-up {
  height: 1200px;
}

.list-all-view-height {
  height: 1200px;
}
.organization .list-all .list {
  width: 100%;
  height: auto;
  display: flex;
  flex-wrap: wrap;
  position: absolute;
  left:0;
  top: 1500px;
}
.organization .list0.list0-up, 
.organization .list003.list003-up, 
.organization .list004.list004-up, 
.organization .list007.list007-up, 
.organization .list006.list006-up, 
.organization .list005.list005-up, 
.organization .list002.list002-up,
.organization .list7.list7-up{
  top:50px;
  background-size: 100% 100%;
  transition-duration: 1s;
  transition-delay: 0s;
  transition-timing-function: cubic-bezier(0.019, 1, 0.22, 1);
  transition-property: all;
}

.organization .list000.list000-up, 
.organization .list001.list001-up, 
.organization .list002.list002-up, 
.organization .list003.list003-up, 
.organization .list004.list004-up, 
.organization .list005.list005-up, 
.organization .list006.list006-up,
.organization .list7.list7-up{
  top:50px;
  background-size: 100% 100%;
  transition-duration: 1s;
  transition-delay: 0s;
  transition-timing-function: cubic-bezier(0.019, 1, 0.22, 1);
  transition-property: all;
}

.he_position {
  top:50px!important;
  background-size: 100% 100%;
  transition-duration: 1s;
  transition-delay: 0s;
  transition-timing-function: cubic-bezier(0.019, 1, 0.22, 1);
  transition-property: all;
}

.organization .list-all .list-box{
  width: 360px;
  background: #fff;
  border: 1px solid #ccc;
  border-radius: 15px;
  padding: 20px;
  box-sizing: border-box;
  display: flex;
  margin: 20px;
  overflow: hidden;
}
.organization .list-all .list-box .photo{
  width: 94px;
  height: 113px;
  margin-right: 50px;
}

.organization .list-all .list-box .contents h5{
  font-size: 16px;
  font-weight: 400;
  letter-spacing: -0.5px;
}
.organization .list-all .list-box .contents h6{
  font-size: 12px;
  font-weight: 500;
  color: #e1e1e1;
  width: 120%;
  border-top: 3px solid #ef8e2e;;
  padding: 7px 0;
  margin-top: 7px;
}
.organization .list-all .list-box .contents p{
  font-size: 11px;
  color: #000;
  line-height: 19px;
}


/*추가*/
.organization .list-all-view {
  position: relative;
  max-width: 1200px;
  height: 0px;
  box-sizing: border-box;
  margin: auto;
  overflow: hidden;
}
.organization .list-all-view .list {
  width: 100%;
  height: auto;
  display: flex;
  flex-wrap: wrap;
  position: absolute;
  /*left:0;*/
  top: 1500px;
}

.organization .list-all-view .list-box{
  width: 360px;
  background: #fff;
  border: 1px solid #ccc;
  border-radius: 15px;
  padding: 20px;
  box-sizing: border-box;
  display: flex;
  margin: 20px;
  overflow: hidden;
}
.organization .list-all-view .list-box .photo{
  width: 94px;
  height: 113px;
  margin-right: 50px;
}

.organization .list-all-view .list-box .contents h5{
  font-size: 16px;
  font-weight: 400;
  letter-spacing: -0.5px;
}
.organization .list-all-view .list-box .contents h6{
  font-size: 12px;
  font-weight: 500;
  color: #e1e1e1;
  width: 120%;
  border-top: 3px solid #ef8e2e;;
  padding: 7px 0;
  margin-top: 7px;
}
.organization .list-all-view .list-box .contents p{
  font-size: 11px;
  color: #000;
  line-height: 19px;
}


@media screen and (max-width: 1024px) {
    .organization .list-all .list-box {
        width: 288px;
        padding: 20px 10px;
    }

    .organization .list-all .list-box .photo {
        width: 94px;
        height: 100px;
        margin-right: 10px;
    }
}

@media screen and (max-width: 768px) {
    .organization .chart .org2::before {
        left: -178px;
    }
    .organization .chart .org2::after {
        right: -175px;
    }
    .organization .list-all .list-box {
        width: 44.5%;
    }
    .organization .list-all {
        max-height: 1700px;
    }

    .organization .list-all.list-all-up {
        height: 1700px;
    }
}

@media screen and (max-width:425px){
    .he_ORG {
        width: 140px!important;
        margin-top: 40px;
    }

    .he_ORG > h4 {
        font-size: 14px!important;
        line-height: 1.8!important;
    }

    /*추가*/
    .org2-2 {
        width: 70px;
        height: 70px;
    }

    .org2-1 {
        width: 70px;
        height: 70px;
    }
    .org2-2 {
        background:#fff;
    }

    .organization .chart .org2{
        width: 60px;
        height: 60px;
        position: relative;
        top:1px;
    }

    .organization .chart .org2 h3 {
        font-size: 16px;
    }

    .organization .chart .org2 h3 {
        line-height: 60px;
    }

    .organization .chart .org3 {
        width: 140px;
    }
    
    .org1-1 {
        width: 60px;
        height: 60px;
    }

    .org1-2 {
        width: 80px;
        height: 80px;
    }

    .organization .chart .org1 h3{
        font-size: 16px;
        font-weight: 500;
        line-height: 80px;
        text-align: center;
      }

    .organization .chart .org1::after {
        left: 30px;
        height: 65px;
        background:#999;
    }

    .organization .chart .org2::before {
        display:none;
    }

    .organization .chart .org2::after {
        display: none;
    }
 
    .organization .chart .org1{
        width: 60px;
        height: 60px;
        border-radius: 100%;
        background: #1e2236;
        margin: auto;
        position: relative;
    }

  .organization .chart .org1::before{
    content: "";
    position: absolute;
    bottom: -135px;
    left:-70px;
    width: 200px;
    height: 20px;
    border-top:2px solid #999;
    border-left:2px solid #999;
    border-right:2px solid #999;
    background: none;
  
  }

  .organization .chart .org-box{
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-left: 0px;
    margin-top: 0px;
  }
  
  .organization .chart .org2::before{
    content: "";
    position: absolute;
    top:150px;
    left:-70px;
    width: 200px;
    height: 20px;
    border-top:2px solid #999;
    border-left:2px solid #999;
    border-right:2px solid #999;
    border-bottom: none;
   
  
  }
  .organization .chart .org2::after{
    content: "";
    position: absolute;
    top:220px;
    left:-70px;
    width: 200px;
    height: 20px;
    border-top:2px solid #999;
    border-left:2px solid #999;
    border-right:2px solid #999;
    border-bottom: none;

  }
 
  .organization .chart .org3-box1{
   left:20px;
  }
  .organization .chart .org3-box2{
 right:20px;
  }
  .organization .chart .org3{
    border-radius: 10px;
    background: #fff;
    border: 1px solid #ef8e2e;
    display: inline-block;
    padding: 0 10px;
    box-sizing: border-box;
    position: relative;
    cursor: pointer;
    z-index: 99;
    display:flex;
    align-items: center;
    justify-content: center;
    
  }
  .organization .chart .org3+.org3 {
    margin-top: 40px;
  }
  
  
  .organization .chart .org3 h4{
    font-size: 14px;
    font-weight: 500;
    color: #000;
    line-height: 20px;
    letter-spacing: -1px;
    text-align: center;
  }
  .organization .chart .org3:hover,
  .organization .chart .org3:active,
  .organization .chart .org3:focus{
    background: #ef8e2e;
    border: 1px solid #ef8e2e;
  }
  .organization .chart .org3:hover h4,
  .organization .chart .org3:active h4,
  .organization .chart .org3:focus h4{
    color: #fff;
  }

  .organization .list-all {
    position: relative;
    max-width: 400px;
    height: auto;
    box-sizing: border-box;
    margin: auto;
    overflow: none;
    top:0px;
    z-index: 9999;
  }
  .organization .list-all.list-all-up {
    height: 2300px;
  }

  .organization .list-all {
     max-height: 2300px;
  }
  .organization .list-all .list {
    width: 100%;
    height: auto;
    display: flex;
    flex-wrap: wrap;
    position: absolute;
    left:0;
    /*top: 1500px;*/
  }
  .organization .list0.list0-up, 
  .organization .list003.list003-up, 
  .organization .list004.list004-up, 
  .organization .list007.list007-up, 
  .organization .list006.list006-up, 
  .organization .list005.list005-up, 
  .organization .list002.list002-up{
    top:30px;
    background-size: 100% 100%;
    transition-duration: 1s;
    transition-delay: 0s;
    transition-timing-function: cubic-bezier(0.019, 1, 0.22, 1);
    transition-property: all;
  }
  
  .organization .list-all .list-box{
    width: 100%;
    background: #fff;
    border: 1px solid #ccc;
    border-radius: 15px;
    padding: 20px 10px;
    box-sizing: border-box;
    display: flex;
    margin: 5px;
  }
  .organization .list-all .list-box .photo{
    width: 60px;
    height: 72px;
    background: #fff;
    margin-right: 30px;
  }
  
  .organization .list-all .list-box .contents h5{
    font-size: 13px;
    font-weight: 400;
    letter-spacing: -0.5px;
    line-height: 18px;
  }
  .organization .list-all .list-box .contents h6{
    font-size: 10px;
    font-weight: 500;
    color: #0d2ed3;
    width: 120%;
    border-top: 3px solid #ef8e2e;
    padding: 4px 0;
    margin-top: 4px;
  }
  .organization .list-all .list-box .contents p{
    font-size: 9px;
    color: #000;
    line-height: 18px;
  }
}

@media screen and (max-width:390px) {
    .organization .list-all .list-box .photo {
        width: 70px;
        height: 82px;
    }

    .organization .list-all.list-all-up {
        height: 2460px;
    }
    .organization .list-all {
        max-height:2460px;
    }

    .organization .chart .org3-box1 {
        position: relative;
        left: -10px;
    }
    .organization .chart .org3-box2 {
        position: relative;
        right:-10px;
    }
    .org2-2 {
        width: 90px;
        height: 90px;
    }
}

.he {
    display: flex;
    align-items: center;
    justify-content: center;
}

/*추가*/
.he_ORG {
    width: 224px;
    height: 50px;
    border-radius: 10px;
    background: #fff;
    border: 1px solid #ef8e2e;
    display: inline-block;
    padding: 0 20px;
    box-sizing: border-box;
    position: relative;
    cursor: pointer;
    z-index: 99;
}
.he_ORG > h4 {
    font-size: 16px;
    font-weight: 500;
    color: #000;
    line-height: 48px;
    letter-spacing: -1px;
    text-align: center;
}

.list-all-view-up {
  height: 1200px!important;
}


    </style>

    <script>
        $(document).ready(function () {
            $('.list-all').on('click', function (e) {
                if (!$('.org3,.org2 > h3').is(e.target)
                    && $('.org3,.org2 > h3').has(e.target).length === 0
                    && $('.org3,.org2 > h3').has(e.target).length === 0
                    ) {
                    $('.list-all').removeClass('list-all-up');
                }

                else {

                }
            });

            /*list 불러 오는 부분*/
            $('.org2>h3')
            .on('click', function () {
                $('.list-all').addClass('list-all-up');
                $('.list001').addClass('list001-up');
                $('.list001').css("display", "flex");

                $('.list003').removeClass('list003-up');
                $('.list003').css("display", "none");
                $('.list004').removeClass('list004-up');
                $('.list004').css("display", "none");
                $('.list007').removeClass('list007-up');
                $('.list007').css("display", "none");
                $('.list006').removeClass('list006-up');
                $('.list006').css("display", "none");
                $('.list005').removeClass('list005-up');
                $('.list005').css("display", "none");
                $('.list002').removeClass('list002-up');
                $('.list002').css("display", "none");

                $('.list-all-view').removeClass('list-all-view-up');
                $('.list-all-view > .list').css("display", "none");
            })

            $('.org3-003')
              .on('click', function () {
                  $('.list-all').addClass('list-all-up');
                  $('.list003').addClass('list003-up');
                  $('.list003').css("display", "flex");

                  $('.list001').removeClass('list001-up');
                  $('.list001').css("display", "none");
                  $('.list004').removeClass('list004-up');
                  $('.list004').css("display", "none");
                  $('.list007').removeClass('list007-up');
                  $('.list007').css("display", "none");
                  $('.list006').removeClass('list006-up');
                  $('.list006').css("display", "none");
                  $('.list005').removeClass('list005-up');
                  $('.list005').css("display", "none");
                  $('.list002').removeClass('list002-up');
                  $('.list002').css("display", "none");

                  $('.list-all-view').removeClass('list-all-view-up');
                  $('.list-all-view > .list').css("display", "none");
              })

            $('.org3-004')
            .on('click', function () {
                $('.list-all').addClass('list-all-up');
                $('.list004').addClass('list004-up');
                $('.list004').css("display", "flex");

                $('.list001').removeClass('list001-up');
                $('.list001').css("display", "none");
                $('.list003').removeClass('list003-up');
                $('.list003').css("display", "none");
                $('.list007').removeClass('list007-up');
                $('.list007').css("display", "none");
                $('.list006').removeClass('list006-up');
                $('.list006').css("display", "none");
                $('.list005').removeClass('list005-up');
                $('.list005').css("display", "none");
                $('.list002').removeClass('list002-up');
                $('.list002').css("display", "none");

                $('.list-all-view').removeClass('list-all-view-up');
                $('.list-all-view > .list').css("display", "none");
            })

            $('.org3-007')
            .on('click', function () {
                $('.list-all').addClass('list-all-up');
                $('.list007').addClass('list007-up');
                $('.list007').css("display", "flex");

                $('.list001').removeClass('list001-up');
                $('.list001').css("display", "none");
                $('.list003').removeClass('list003-up');
                $('.list003').css("display", "none");
                $('.list004').removeClass('list004-up');
                $('.list004').css("display", "none");
                $('.list006').removeClass('list006-up');
                $('.list006').css("display", "none");
                $('.list005').removeClass('list005-up');
                $('.list005').css("display", "none");
                $('.list002').removeClass('list002-up');
                $('.list002').css("display", "none");

                $('.list-all-view').removeClass('list-all-view-up');
                $('.list-all-view > .list').css("display", "none");
            })

            $('.org3-006')
            .on('click', function () {
                $('.list-all').addClass('list-all-up');
                $('.list006').addClass('list006-up');
                $('.list006').css("display", "flex");

                $('.list001').removeClass('list001-up');
                $('.list001').css("display", "none");
                $('.list003').removeClass('list003-up');
                $('.list003').css("display", "none");
                $('.list004').removeClass('list004-up');
                $('.list004').css("display", "none");
                $('.list007').removeClass('list007-up');
                $('.list007').css("display", "none");
                $('.list005').removeClass('list005-up');
                $('.list005').css("display", "none");
                $('.list002').removeClass('list002-up');
                $('.list002').css("display", "none");

                $('.list-all-view').removeClass('list-all-view-up');
                $('.list-all-view > .list').css("display", "none");

            })

            $('.org3-005')
            .on('click', function () {
                $('.list-all').addClass('list-all-up');
                $('.list005').addClass('list005-up');
                $('.list005').css("display", "flex");

                $('.list001').removeClass('list001-up');
                $('.list001').css("display", "none");
                $('.list003').removeClass('list003-up');
                $('.list003').css("display", "none");
                $('.list004').removeClass('list004-up');
                $('.list004').css("display", "none");
                $('.list007').removeClass('list007-up');
                $('.list007').css("display", "none");
                $('.list006').removeClass('list006-up');
                $('.list006').css("display", "none");
                $('.list002').removeClass('list002-up');
                $('.list002').css("display", "none");

                $('.list-all-view').removeClass('list-all-view-up');
                $('.list-all-view > .list').css("display", "none");

            })

            $('.org3-002')
            .on('click', function () {
                $('.list-all').addClass('list-all-up');
                $('.list002').addClass('list002-up');
                $('.list002').css("display", "flex");

                $('.list001').removeClass('list001-up');
                $('.list001').css("display", "none");
                $('.list003').removeClass('list003-up');
                $('.list003').css("display", "none");
                $('.list004').removeClass('list004-up');
                $('.list004').css("display", "none");
                $('.list007').removeClass('list007-up');
                $('.list007').css("display", "none");
                $('.list006').removeClass('list006-up');
                $('.list006').css("display", "none");
                $('.list005').removeClass('list005-up');
                $('.list005').css("display", "none");

                $('.list-all-view').removeClass('list-all-view-up');
                $('.list-all-view > .list').css("display", "none");
            })

            //
         
            
        });

        var tempid = '';

        function onDeptClick(obj) {
            //console.log(obj);
           

            console.log($(obj).attr('id'));
            var temp = $(obj).attr('id');

            tempid = temp;

            var classNM = 'list' + temp + '-up';

            $('.org3-box1').each(function (index, item) {
                console.log(index + "/" + item);
            });

            $('.list-all').addClass('list-all-up');
            
            $('.list' + temp).addClass(classNM);
            $('.list' + temp).removeClass(tempid);
            //$('.list' + temp).addClass('list002-up');

        }

    </script>

    <script>
        $(document).ready(function () {
            $("#he_ORG_button").click(function () {
                $(".list-all-view").addClass("list-all-view-up");
                $(".list-all-view > .list").css("display", "flex");
                $(".organization .list-all-view .list").addClass("he_position");
            });
        });
    </script>
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="wrap">
    <div class="align">
      <div class="organization">
        <div class="chart">

          <div class="org1">
              <div class="org1-1">
                  <div class="org1-2">
                       <h3>고객</h3>
                  </div>
              </div>
          </div>
          <div class="org-box">
            <div class="org3-box org3-box1">
                <div class="samll_box"></div>
              <div class="org3 org3-003"><h4>스마트 물류 플랫폼사업본부</h4></div>
              <div class="org3 org3-004"><h4>스마트 여행 플랫폼사업본부</h4></div>
              <div class="org3 org3-007"><h4>스마트 쇼핑몰 플랫폼사업본부</h4></div>
            </div>

            <div class="org2-2">
                <div class="org2-1">
                    <div class="org2 org3-001"><h3>CEO</h3></div>
                </div>
            </div>

            <div class="org3-box org3-box2">
              <div class="org3 org3-006"><h4>스마트 플랫폼연구실</h4></div>
              <div class="org3 org3-005"><h4>디자인 연구실</h4></div>
              <div class="org3 org3-002"><h4>경영 기획실</h4></div>
            </div>
          </div>

            <div class="he" id="he">
                <div class="he_ORG" id="he_ORG_button"><h4>로지AI 혁신연구소</h4></div>
            </div>

        </div>
        
        <div class="list-all-view">
            <div class="list">
                <%--박남규--%>
                <div class="list-box">
                    <div class="photo">
                        <img src="/Source/Client/img/park_nam.jpg" alt="Alternate Text" />
                    </div>
                    <div class="contents">
                        <h5>로지AI 혁신연구소</h5>
                        <h6 style="width: 180%;">--------</h6>
                        <p>성명 : 박남규</p>
                        <p>직급 : 소장</p>
                    </div>
                </div>
                <%--박남규--%>
                <div class="list-box">
                    <div class="photo">
                        <img src="/Source/Client/img/he_kim.png" alt="Alternate Text" />
                    </div>
                    <div class="contents">
                        <h5>로지AI 혁신연구소</h5>
                        <h6>--------</h6>
                        <p>성명 : 김경민</p>
                        <p>직급 : 사원</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="list-all">
            <% for (int i = 0; i < resultDS.Tables.Count; i++){ %>
                <div class="list list<%= resultDS.Tables[i].TableName.ToString() %>">
                <% for (int j = 0; j < resultDS.Tables[i].Rows.Count; j++) { %>
                    <div class="list-box">
                      <div class="photo">
                          <img src="<%=ConfigurationManager.AppSettings["USER_IMAGE_PATH"] %>/<%= resultDS.Tables[i].Rows[j]["USER_IMAGE_PATH"].ToString()%>" alt="Alternate Text"/>
                      </div>
                      <div class="contents">
                        <h5><%=  resultDS.Tables[i].Rows[j]["DEPT_NM"].ToString() %></h5>
                        <h6>--------</h6>
                        <p>성명 : <%=  resultDS.Tables[i].Rows[j]["USER_NAME"].ToString() %> / 직급 : <%= resultDS.Tables[i].Rows[j]["POSITION_NM"].ToString()  %></p>
                        <p>E-MAIL :  <%=  resultDS.Tables[i].Rows[j]["EMAIL_ADDRESS"].ToString() %> </p>
                      </div>
                    </div>
                <% } %>
                </div>
            <% } %>
        </div>
      </div>
    </div>
  </div>
<%--    <%for(int i = 0 ; i < listDEPT.Rows.Count;i++){ %>
        <div>
            <div><%=listDEPT.Rows[i]["USER_NAME"] %></div>
            <div><img src="<%=ConfigurationManager.AppSettings["USER_IMAGE_PATH"] %>/<%=listDEPT.Rows[i]["USER_IMAGE_PATH"] %>"/></div>
        </div>
    <%} %>--%>

       
    
</asp:Content>
