<template>
    <router-view></router-view>
</template>

<style>
  *{
    margin: 0;
    padding: 0;
  }
  html,body{
    font-family: 宋体,serif;
    overflow-x: hidden;
    font-size: 40%;
    height: 100%;
    z-index: -1;
  }
  #app{
    top:0;
    right:0;
    bottom:0;
    left:0;
    height: 100%;
  }
  ::-webkit-scrollbar
  {
    width:10px;
    height:16px;
    background-color: #101010;
  }
  /*定义滚动条轨道
   内阴影+圆角*/
  ::-webkit-scrollbar-track
  {
    -webkit-box-shadow:inset 0 0 6px rgba(0,0,0,0.3);
    border-radius:10px;
    background-color: #1d1c1c;
  }
  /*定义滑块
   内阴影+圆角*/
  ::-webkit-scrollbar-thumb
  {
    border-radius:7px;
    -webkit-box-shadow:inset 0 0 6px rgba(0,0,0,.3);
    background-color:#555;
  }
</style>
