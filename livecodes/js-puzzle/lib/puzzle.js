const hintButton = document.querySelector('#show-hint');
const hintDiv    = document.querySelector('.hint');
const allTiles = document.querySelectorAll('td');

const moveTile = (tile, emptyTile) => {
  tile.classList.add('empty');
  emptyTile.classList.remove('empty');

  let tileInnerText = tile.innerText;
  tile.innerText = "";
  emptyTile.innerText = tileInnerText;
}

const canMove = (tile, emptyTile) => {
  const tileColumnIndex = tile.cellIndex;
  const emptyColumnIndex = emptyTile.cellIndex;

  const tileRowIndex = tile.parentElement.rowIndex;
  const emptyRowIndex = emptyTile.parentElement.rowIndex;

  if (([1, -1].includes(tileColumnIndex - emptyColumnIndex) && (tileRowIndex === emptyRowIndex)) ||
     ([1, -1].includes(tileRowIndex - emptyRowIndex) && (tileColumnIndex === emptyColumnIndex))) {
    return true;
  } else {
    return false;
  }
}

const move = (event) => {
  const tile = event.currentTarget;
  const emptyTile = document.querySelector('.empty');

  if (canMove(tile, emptyTile)) {
    moveTile(tile, emptyTile);
  }
}

allTiles.forEach((tile) => {
  // Old version!
  // tile.addEventListener('click', (event) => {
  //   const emptyTile = document.querySelector('.empty');

  //   if (canMove(tile, emptyTile)) {
  //     moveTile(tile, emptyTile);
  //   }  
  // });
  tile.addEventListener('click', move);
})

hintButton.addEventListener('click', (event) => {
  hintDiv.classList.toggle('active');
})