link = document.createElement "link"
link.rel = "stylesheet"
link.href = "style.css"
document.head.appendChild link

table = document.createElement "table"
headerRow = document.createElement "tr"
table.appendChild headerRow
headerCell = document.createElement "th"
headerCell.contentEditable = true
headerCell.oninput = () -> addColumnTo table
headerRow.appendChild headerCell

document.body.appendChild table

addHeaderCellTo = (row) ->
  cell = document.createElement "th"
  cell.contentEditable = true
  row.appendChild cell
  return cell

addDataCellTo = (row) ->
  cell = document.createElement "td"
  cell.contentEditable = true
  row.appendChild cell
  return cell

transferOnInput = (source, target) ->
  target.oninput = source.oninput
  source.oninput = null

addRowTo = (table) ->
  row = document.createElement "tr"
  transferOnInput aboveRow, addDataCellTo row for aboveRow in tail(table.rows).cells
  table.appendChild row

tail = (list) ->
  [..., last] = list
  return last

addColumnTo = (table) ->
  lastHeader = tail table.rows[0].cells
  lastHeader.oninput = null

  lastHeader = addHeaderCellTo table.rows[0]
  lastHeader.oninput = () -> addColumnTo table
  if table.rows.length is 1
    table.appendChild document.createElement "tr"
  addDataCellTo row for row in [].slice.call(table.rows)[1..]

  tail(tail(table.rows).cells).oninput = () -> addRowTo table
  return
