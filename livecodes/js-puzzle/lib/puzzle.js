// todo

const hintButton = document.querySelector('#show-hint');
const hintDiv    = document.querySelector('.hint');

hintButton.addEventListener('click', (event) => {
  hintDiv.classList.toggle('active');
})

// Functions: (1) can/need to move; (2) swap/move the tiles

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

const allTiles = document.querySelectorAll('td');
allTiles.forEach((tile) => {
  tile.addEventListener('click', (event) => {
    let emptyTile = document.querySelector('.empty');

    if (canMove(tile, emptyTile)) {
      moveTile(tile, emptyTile);
    }
  })
})