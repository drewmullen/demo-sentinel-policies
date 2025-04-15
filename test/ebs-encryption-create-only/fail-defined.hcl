mock "tfplan/v2" {
    module {
        source = "./testdata/tfplan-fail-defined.sentinel"
    }
}

test {
    rules  = {
        main = false
    }
}