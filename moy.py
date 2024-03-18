def noteExam(final, continu):
    exam = (final - continu*0.4)/0.6
    return exam

final = float(input("Entrer la moyenne finale : "))
continu = float(input("Entrer la note de controle continu : "))

print("La note de l'examen est : ", noteExam(final, continu))