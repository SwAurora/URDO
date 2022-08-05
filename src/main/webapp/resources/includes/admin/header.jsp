<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
  <header>
	  <div id="headerTop">
	      <h1></h1>
	      <ul id="headernav">
	        <li id="todobtn"><a href="javascript:showTodolist()">TODO </a></li>
	        <!-- 클릭시 todo -->
	        <li> LOGOUT </li>
	      </ul>
	  </div>
	
	  <div id="todolist">
	 
	    <div id="txtbox">
	        <input type="text" id="txt" placeholder="할 일을 입력하세요">
	        <button class="add" onclick="addlist()"> + </button>
	    </div>
	
	    <nav id="DoDone">
	        <ul>
	          <a href="javascript:Showdoitlist()"><li class="on">Doit</li></a>
	          <a href="javascript:Showdonelist()"><li>Done</li></a>
	        </ul>
	    </nav>
	
	    <div class="contentbox doit">
	        <table id="doing" class="list"></table>
	    </div>
	    <div class="contentbox done">
	        <table id="donelist" class="list"></table>
	    </div>
	</div>


        
	  <div id="headerBottom">
	  
	  <h2> Hello, Admin.</h2>
	  
	  </div>

    </header>
    