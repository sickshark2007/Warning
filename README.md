# Warning
uma barrinha até que bem util para servidores.

# Uso:
```pawn
public OnPlayerConnect(playerid)
{
	swarning(playerid, "Conta_Logada", "Conta Logada", "Login efetuado com sucesso.");
	return 1;
}

Warning:Conta_Logada(playerid, Float:p)
{
	if(p > 50) SendClientMessage(playerid, 0xFF6347AA, "Sua barrinha está em 50%%");
	else if(p >= 100) SendClientMessage(playerid, 0xFF6347AA, "Sua desapareceu =(");
	SendClientMessage(playerid, 0xFF6347AA, "Sendo chamada =)");
	return 1;
}
```

---

![a](https://github.com/skyMateus/Warning/blob/main/loading.png)
