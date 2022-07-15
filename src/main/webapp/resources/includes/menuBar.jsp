<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="Menu_bar">
    <span>게시판</span>

    <ul class="depth1">
      <li>
        <input type="checkbox" id="check1">
        <label for="check1">
          <span class="plus_minus">&#65291</span>
          <img src="../resources/img/sidebar/menu-best.svg" alt="board" class="navIcon menuIcon">
          <span>베스트 게시글</span>
        </label>
        <ul class="depth2">
          <li><a href="board_nowBest.html" title="실시간베스트">실시간 베스트</a></li>
          <li><a href="board_monthBest.html" title="월간베스트">월간 베스트</a></li>
          <li><a href="board_miniBest.html" title="미니홈피추천작">미니홈피 추천작</a></li>
        </ul>
      </li>
      <li>
        <input type="checkbox" id="check2">
        <label for="check2">
          <span class="plus_minus">&#65291</span>
          <img src="../resources/img/sidebar/menu-humor.svg" alt="board" class="navIcon menuIcon">
          <span>유머</span>
        </label>
        <ul class="depth2">
          <li><a href="/BoardHumor.do" title="웃긴 자료">웃긴 자료</a></li>
        </ul>
      </li>
      <li>
        <input type="checkbox" id="check3">
        <label for="check3">
          <span class="plus_minus">&#65291</span>
          <img src="../resources/img/sidebar/menu-creation.svg" alt="board" class="navIcon menuIcon">
          <span>창작게시판</span>
        </label>
        <ul class="depth2">
          <li><a href="/BoardCreArt.do" title="그림">그림</a></li>
          <li><a href="board_creCook.html" title="요리">요리</a></li>
        </ul>
      </li>
      <li>
        <input type="checkbox" id="check4">
        <label for="check4">
          <span class="plus_minus">&#65291</span>
          <img src="../resources/img/sidebar/menu-region.svg" alt="board" class="navIcon menuIcon">
          <span>지역</span>
        </label>
        <ul class="depth2">
          <li><a href="board_regionRestaurant.html" title="맛집">맛집</a></li>
          <li><a href="board_regionLandMark.html" title="명소">명소</a></li>
        </ul>
      </li>
      <li>
        <input type="checkbox" id="check5">
        <label for="check5">
          <span class="plus_minus">&#65291</span>
          <img src="../resources/img/sidebar/menu-theme.svg" alt="board" class="navIcon menuIcon">
          <span>테마</span>
        </label>
        <ul class="depth2">
          <li><a href="board_themeGame.html" title="게임">게임</a></li>
          <li><a href="board_themeSports.html" title="스포츠">스포츠</a></li>
          <li><a href="board_themeMusic.html" title="음악">음악</a></li>
        </ul>
      </li>
    </ul>
  </div>