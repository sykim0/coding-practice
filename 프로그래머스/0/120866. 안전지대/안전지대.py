# 좌표 개념 이용하기

def solution(board):
    danger = set()
    n = len(board)
    
    for i, row in enumerate(board) : # 행 순환
        for j, col in enumerate(row) : # 해당 행에서 열 순환
            if col == 1 : # 만약 지뢰가 설치된 지형일 때
                for x in (-1, 0, 1) : # 왼쪽, 본인, 오른쪽  옆 확인
                    for y in (-1, 0, 1) : # 위, 본인, 아래쪽 확인
                        # x + i > -1이 아니면, 즉, x + i <= 0 이면 벽 쪽임
                        # y + j 도 마찬가지
                        if -1 < x+i < n and  -1 < y+j < n : 
                            danger.add((x+i, y+j)) # 위험 좌표에도 1이 담김.
                
    
    answer = n**2 - len(danger) # 이러면 전체 사이즈에서 위험 좌표 개수 빼주기만 하면 됨.
    return answer