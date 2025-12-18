rule all:
    input:
        "results/output.txt"

rule run_script:
    output:
        "results/output.txt"
    script:
        "scripts/simple_script.py"