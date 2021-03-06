PK
     g�4T��ú  �  
   index.html<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />

    <link rel="stylesheet" href="style.css" />

    <!-- Esta línea es la que permite la interacción con Delta Chat: -->
    <script src="webxdc.js"></script>

    <script src="script.js" defer></script>
  </head>
  <body>
    <div class="container">
      <section id="Display-area">
        <div class="currentInput"></div>
        <div class="answerScreen">0</div>
      </section>
      <section class="keypad-btns">
        <button type="button" class="fun_btn" id="clear" value="">C</button>
        <button type="button" class="fun_btn" id="erase" value="">
          &#11013;
        </button>
        <button type="button" class="fun_btn" value="/">/</button>
        <button type="button" class="fun_btn" value="%">%</button>
        <button type="button" class="num_btn" value="7">7</button>
        <button type="button" class="num_btn" value="8">8</button>
        <button type="button" class="num_btn" value="9">9</button>
        <button type="button" class="fun_btn" value="*">x</button>
        <button type="button" class="num_btn" value="4">4</button>
        <button type="button" class="num_btn" value="5">5</button>
        <button type="button" class="num_btn" value="6">6</button>
        <button type="button" class="fun_btn" value="-">-</button>
        <button type="button" class="num_btn" value="1">1</button>
        <button type="button" class="num_btn" value="2">2</button>
        <button type="button" class="num_btn" value="3">3</button>
        <button type="button" class="fun_btn" value="+">+</button>
        <button type="button" class="num_btn" value="00">00</button>
        <button type="button" class="num_btn" value="0">0</button>
        <button type="button" class="num_btn" value=".">.</button>
        <button type="button" class="fun_btn" id="evaluate" value="">=</button>
      </section>
    </div>
  </body>
</html>
PK
     C}4Tt�         manifest.tomlname = "Intento de Massick"PK
     $4T��F  F  	   script.js// Variables
let currentInput = document.querySelector(".currentInput");
let answerScreen = document.querySelector(".answerScreen");
let buttons = document.querySelectorAll("button");
let erasebtn = document.querySelector("#erase");
let clearbtn = document.querySelector("#clear");
let evaluate = document.querySelector("#evaluate");

// Calculator Display
let realTimeScreenValue = [];

// To Clear

clearbtn.addEventListener("click", () => {
  realTimeScreenValue = [""];
  answerScreen.innerHTML = 0;
  currentInput.className = "currentInput";
  answerScreen.className = "answerScreen";
  answerScreen.style.color = " rgba(150, 150, 150, 0.87)";
});

// Get value of any button clicked and display to the screen

buttons.forEach((btn) => {
  btn.addEventListener("click", () => {
    // when clicked button is not erased button
    if (!btn.id.match("erase")) {
      // To display value on btn press
      realTimeScreenValue.push(btn.value);
      currentInput.innerHTML = realTimeScreenValue.join("");

      // To evaluate answer in real time
      if (btn.classList.contains("num_btn")) {
        answerScreen.innerHTML = eval(realTimeScreenValue.join(""));
      }
    }

    // When erase button is clicked
    if (btn.id.match("erase")) {
      realTimeScreenValue.pop();
      currentInput.innerHTML = realTimeScreenValue.join("");
      answerScreen.innerHTML = eval(realTimeScreenValue.join(""));
    }

    // When clicked button is evaluate button
    if (btn.id.match("evaluate")) {
      currentInput.className = "answerScreen";
      answerScreen.className = "currentInput";
      answerScreen.style.color = "white";
    }

    // To prevent undefined error in screen
    if (typeof eval(realTimeScreenValue.join("")) == "undefined") {
      answerScreen.innerHTML = 0;
    }
  });
});
PK
     �~4T�p    	   style.css* {
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

body {
    background-color: #f5f5f5;
    min-height: 90vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.container {
    background-color: #131313;
    max-width: 300px;
    height: auto;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 25px 35px;
    border-radius: 10px;
    -webkit-user-select: none;
       -moz-user-select: none;
        -ms-user-select: none;
            user-select: none;
}

#Display-area {
    width: 100%;
    margin: 3vh 0;
    display: grid;
    grid-template-columns: 100%;
    grid-template-rows: repeat(2, minmax(40px, auto));
    word-wrap: break-word;
    padding-bottom: 20px;
    border-bottom: 1px rgba(128, 128, 128, 0.116) solid;
}

#Display-area .currentInput {
    /* display: flex; */
    text-align: right;
    height: 8vh;
    color: white;
    font-size: xx-large;
    line-height: 2;
    word-wrap: break-word;
}

#Display-area .answerScreen {
    text-align: right;
    color: rgba(150, 150, 150, 0.87);
    height: 7px;
    line-height: 3;
    font-size: larger;
}

.keypad-btns {
    display: grid;
    grid: repeat(5, 70px) / repeat(4, 70px);
    grid-row-gap: 20px;
    grid-column-gap: 20px;
}

.keypad-btns button {
    outline: none;
    border: none;
    border-radius: 10px;
    background-color: #131313;
    color: white;
    font-size: x-large;
}

.keypad-btns .fun_btn {
    color: #ff8800;
}

.num_btn:hover,.fun_btn:hover {
    background-color: rgba(29, 29, 29, 0.979);
}

@media only screen and (max-width: 600px) {
    body {
        background-color: #131313;
        align-items: flex-start;
    }
}PK 
     g�4T��ú  �  
 $               index.html
         �xw���xw��d��i�PK 
     C}4Tt�       $           �  manifest.toml
         ��E����E���	���PK 
     $4T��F  F  	 $           (  script.js
         �
���
���|���PK 
     �~4T�p    	 $           �  style.css
         ^p���^p����B�w�PK      q  �    