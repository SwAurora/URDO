let canvas = document.getElementById('game');
let context = canvas.getContext('2d');
let grid = 16;
let count = 0;

let snake = {
    x: 160, y: 160,

    // snake velocity. x 또는 y 방향으로 모든 프레임의 그리드 길이를 이동.
    dx: grid, dy: 0,

    // snake 의 바디를 차지하는 모든 grids 를 추적
    cells: [],

    // 뱀의길이. 사과를 먹으면 커진다
    maxCells: 4
};

let apple = {
    x: 320, y: 320
};

// 특정한 범위에서 랜덤한 정수를 불러온다
function getRandomInt(min, max)
{
    return Math.floor(Math.random() * (max - min)) + min;
}

// 게임 루프 
function loop()
{
    requestAnimationFrame(loop);

    // requestAnimationFrame의 기본 60fps가 아닌 15fps로 변경 (60/15 = 4)
    if(++count < 4)
    {
        return;
    }
    count = 0;
    context.clearRect(0, 0, canvas.width, canvas.height);

    // 첫머리의 속도를 따라 움직임
    snake.x += snake.dx;
    snake.y += snake.dy;

    // 화면 가장자리에서 수평으로 뱀 위치 기울이기
    if(snake.x < 0)
    {
        snake.x = canvas.width - grid;
    }
    else if(snake.x >= canvas.width)
    {
        snake.x = 0;
    }

    //스크린 가장자리에서 뱀을 수직으로 꺾음
    if(snake.y < 0)
    {
        snake.y = canvas.height - grid;
    }
    else if(snake.y >= canvas.height)
    {
        snake.y = 0;
    }

    // snake의 방향을 쫓는다. 배열의 앞부분은 항상 0번째
    snake.cells.unshift({x: snake.x, y: snake.y});


    // 이동할때 cell 에 채워진 부분들을 사라지게 만듬
    if(snake.cells.length > snake.maxCells)
    {
        snake.cells.pop();
    }

    // apple 을 그림
    context.fillStyle = getRandomColor();
    context.fillRect(apple.x, apple.y, grid - 1, grid - 1);

    // snake 를 한칸씩 잡아당김
    context.fillStyle = 'orange';
    snake.cells.forEach(function(cell, index)
    {
        // 스네이크 본체의 격자 효과보다 1px 작게 그려서 얼마나 긴지 알 수 있게해준다
        context.fillRect(cell.x, cell.y, grid - 1, grid - 1);

        // 뱀이 사과를 먹으면
        if(cell.x === apple.x && cell.y === apple.y)
        {
            snake.maxCells++;
            // canvas 는 400 x 400 표는 25 x 25
            apple.x = getRandomInt(0, 25) * grid;
            apple.y = getRandomInt(0, 25) * grid;
        }

        // 모든 셀과의 충돌 점검(버블 정렬)
        for(let i = index + 1; i < snake.cells.length; i++)
        {

            // 뱀은 신체 부분과 같은 공간을 차지한다. 게임 리셋
            if(cell.x === snake.cells[i].x && cell.y === snake.cells[i].y)
            {
                let count = snake.maxCells - 4;
                swal({
                    title: "먹은 사과의 갯수",
                    text: count + "개",
                });
                snake.x = 160;
                snake.y = 160;
                snake.cells = [];
                snake.maxCells = 4;
                snake.dx = grid;
                snake.dy = 0;
                apple.x = getRandomInt(0, 25) * grid;
                apple.y = getRandomInt(0, 25) * grid;
            }
        }
    });

    // 사과를 위한 랜덤 색상을 불러와준다
    function getRandomColor()
    {
        return "#" + Math.floor(Math.random() * 0xffffff).toString(16);

    }
}

// 키보드 이벤트 리스너
document.addEventListener('keydown', function(e)
{

    // 왼쪽 방향키
    if(e.which === 37 && snake.dx === 0)
    {
        snake.dx = -grid;
        snake.dy = 0;
    }
    // 위쪽 방향키
    else if(e.which === 38 && snake.dy === 0)
    {
        snake.dy = -grid;
        snake.dx = 0;
    }
    // 오른쪽 방향키
    else if(e.which === 39 && snake.dx === 0)
    {
        snake.dx = grid;
        snake.dy = 0;
    }
    // 아래쪽 방향키
    else if(e.which === 40 && snake.dy === 0)
    {
        snake.dy = grid;
        snake.dx = 0;
    }
});
// 게임 시작
requestAnimationFrame(loop);
