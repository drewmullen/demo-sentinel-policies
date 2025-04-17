mock "tfplan/v2" {
    module {
        source = "./testdata/tfplan-unencrypted.sentinel"
    }
}

mock "tfrun" {
    module {
        source = "./testdata/tfrun-prod.sentinel"
    }
}


test {
    rules  = {
        main = false
    }
}