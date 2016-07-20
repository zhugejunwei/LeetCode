func numIslands(grid: [[Character]]) -> Int {
    var grid = grid
    if grid.isEmpty {
        return 0
    }
    var count = 0
    let row = grid.count, col = grid[0].count
    for i in 0..<row {
        for j in 0..<col {
            if grid[i][j] == "1" {
                // BFS
                BFS(&grid, i, j)
                
                // DFS
                //                DFS(&grid, i, j)
                
                count += 1
            }
        }
    }
    return count
}

// MARK: BFS Solution, 244 ms

func BFS(inout grid: [[Character]], _ x: Int, _ y: Int)
{
    var q = [[Int]]()
    q.append([x,y])
    grid[x][y] = "0"
    while !q.isEmpty {
        let i = q.first![0], j = q.first![1]
        q.removeAtIndex(0)
        if i-1 >= 0 && grid[i-1][j] == "1" {
            grid[i-1][j] = "0"
            q.append([i-1, j])
        }
        if i+1 < grid.count && grid[i+1][j] == "1" {
            grid[i+1][j] = "0"
            q.append([i+1, j])
        }
        if j-1 >= 0 && grid[i][j-1] == "1" {
            grid[i][j-1] = "0"
            q.append([i, j-1])
        }
        if j+1 < grid[0].count && grid[i][j+1] == "1" {
            grid[i][j+1] = "0"
            q.append([i, j+1])
        }
    }
}



// MARK: DFS Solution, 196 ms

func DFS(inout grid: [[Character]], _ x: Int, _ y: Int)
{
    if grid[x][y] == "1" {
        grid[x][y] = "0"
        if x - 1 >= 0 && grid[x-1][y] == "1" {
            DFS(&grid, x-1, y)
        }
        if y - 1 >= 0 && grid[x][y-1] == "1" {
            DFS(&grid, x, y-1)
        }
        if x + 1 < grid.count && grid[x+1][y] == "1" {
            DFS(&grid, x+1, y)
        }
        if y + 1 < grid[0].count && grid[x][y+1] == "1" {
            DFS(&grid, x, y+1)
        }
    }
}

var a:[[Character]] = [["1","0"],["1","0"]]

BFS(&a, 0, 0)




/* Union Find, Java solution from "discuss", 30 ms
 
 public class Solution {
 public int numIslands(char[][] grid) {
 if (grid == null || grid.length == 0 || grid[0].length == 0) return 0;
 UF uf = new UF(grid);
 for (int i = 0; i < grid.length; i++) {
 for (int j = 0; j < grid[0].length; j++) {
 if (i > 0) if (uf.connect(i, j, i - 1, j)) uf.union(i, j, i - 1, j);
 if (i < grid.length - 1) if (uf.connect(i, j, i + 1, j)) uf.union(i, j, i + 1, j);
 if (j > 0) if (uf.connect(i, j, i, j - 1)) uf.union(i, j, i, j - 1);
 if (j < grid[0].length - 1) if (uf.connect(i, j, i, j + 1)) uf.union(i, j, i, j + 1);
 }
 }
 return uf.count;
 }
 class UF {
 int[] id, size;
 char[][] grid;
 int count;
 public UF(char[][] grid) {
 this.grid = grid;
 int x = grid.length, y = grid[0].length;
 this.id = new int[x * y];
 this.size = new int[x * y];
 this.count = 0;
 for (int i = 0; i < x; i++) {
 for (int j = 0; j < y; j++) {
 id[i * y + j] = i * y + j;
 if (grid[i][j] == '1') {
 this.count++;
 this.size[i * y + j] = 1;
 }
 }
 }
 }
 public boolean connect(int x1, int y1, int x2, int y2) {
 return ((Math.abs(x1 - x2) == 1 || Math.abs(y1 - y2) == 1) && !(Math.abs(x1 - x2) == 1 && Math.abs(y1 - y2) == 1) && grid[x1][y1] == '1' && grid[x2][y2] == '1');
 }
 public int find(int x, int y) {
 int index = x * grid[0].length + y;
 while (index != id[index]) index = id[index];
 return index;
 }
 public void union(int x1, int y1, int x2, int y2) {
 int index1 = find(x1, y1), index2 = find(x2, y2);
 if (index1 == index2) return;
 if (size[index1] > size[index2]) {
 size[index1] += size[index2];
 id[index2] = index1;
 }
 else {
 size[index2] += size[index1];
 id[index1] = index2;
 }
 count--;
 }
 }
 }
 */
