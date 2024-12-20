import random

def snakes_and_ladders(pocet_hracu):
    # Nastavení herní desky s hady a žebříky
    ladders = {2: 38, 7: 14, 8: 31, 15: 26, 21: 42, 28: 84, 36: 44, 51: 67, 71: 91, 78: 98, 87: 94}
    snakes = {16: 6, 46: 25, 49: 11, 62: 19, 64: 60, 74: 53, 89: 68, 92: 88, 95: 75, 99: 80}

       # Inicializace hráčů

    player_positions = [0] * num_players
    player_names = [f"Hráč {chr(65 + i)}" for i in range(num_players)]
    game_running = True

    print("\n--- Hra Hadi a žebříky začíná! ---\n")

    while game_running:
        for i, name in enumerate(player_names):
            if not game_running:
                break

            # Hráč háže kostkou
            roll = random.randint(1, 6)
            print(f"{name} hodil {roll}.")

            # Kontrola hodu šestky
            total_roll = roll
            while roll == 6:
                roll = random.randint(1, 6)
                total_roll += roll
                print(f"{name} hodil znovu a získal {roll}, celkem {total_roll}.")

            # Posun hráče
            new_position = player_positions[i] + total_roll
            if new_position > 100:
                print(f"{name} nemůže překročit pole 100 a zůstává na místě.")
                continue
            
            player_positions[i] = new_position
            print(f"{name} se posunul na pole {new_position}.")

            # Kontrola žebříku
            if new_position in ladders:
                player_positions[i] = ladders[new_position]
                print(f"{name} našel žebřík a posunul se na pole {ladders[new_position]}.")

            # Kontrola hada
            if new_position in snakes:
                player_positions[i] = snakes[new_position]
                print(f"{name} potkal hada a spadl na pole {snakes[new_position]}.")

            # Kontrola stejné pozice více hráčů
            for j, position in enumerate(player_positions):
                if j != i and position == player_positions[i]:
                    player_positions[j] = max(0, player_positions[j] - 1)
                    print(f"{player_names[j]} byl posunut zpět na pole {player_positions[j]}.")

            # Kontrola vítězství
            if player_positions[i] == 100:
                print(f"\n{name} vyhrál hru! Gratulujeme!\n")
                game_running = False
                break

if __name__ == "__main__":
    num_players = int(input("Zadejte počet hráčů: "))
    snakes_and_ladders(num_players)
