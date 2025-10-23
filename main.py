from robot import run

if __name__ == "__main__":
    run(
        "testCases/test.robot",
        outputdir="results",
        report="report.html",
        log="log.html"
    )
