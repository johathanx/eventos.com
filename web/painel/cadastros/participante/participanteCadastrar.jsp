<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/painel/header.jsp"/>

<!-- Pagina com o Conteudo -->
<div class="content-wrapper">
    <div class="content-header">
        <div class="container-fluid">
            <div class="card shadow">
                <div class="card-body">

                    <div class="modal-body">

                        <div class="form-group">
                            <input class="form-control" type="hidden" name="idpessoa" id="idpessoa" value="${participante.idPessoa}" readonly="readonly"/>
                            <input class="form-control" type="hidden" name="idparticipante" id="idparticipante" value="${participante.idParticipante}" readonly="readonly"/>
                            <input class="form-control" type="hidden" name="situacao" id="situacao" value="${participante.situacao}" readonly="readonly"/>
                        </div>

                        <div class="form-group">
                            <div class="form-line row">
                                <div class="col-sm">
                                    <label id="labelcpfcnpj">CPF/CNPJ</label>
                                    <input class="form-control" type="text" name="cpfcnpjpessoa" id="cpfcnpjpessoa" value="${participante.cpfCnpjPessoa}" />
                                </div>
                                <div class="col-sm">
                                    <label>RG/IE</label>
                                    <input class="form-control" type="text" name="rgiepessoa" id="rgiepessoa" value="${participante.rgIePessoa}"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-line row">
                                <div class="col-sm">
                                    <label>Nome/Raz�o Social</label>
                                    <input class="form-control" type="text" name="nomerazaopessoa" id="nomerazaopessoa" value="${participante.nomeRazaoPessoa}"/>
                                </div>
                                <div class="col-sm">
                                    <label>Logradouro</label>
                                    <input class="form-control" type="text" name="logradouropessoa" id="logradouropessoa" value="${participante.logradouroPessoa}"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-line row">
                                <div class="col-sm">
                                    <label>N�mero</label>
                                    <input class="form-control" type="text" name="numlogradouropessoa" id="numlogradouropessoa" value="${participante.numLogradouroPessoa}"/>
                                </div>
                                <div class="col-sm">
                                    <label>Bairro</label>
                                    <input class="form-control" type="text" name="bairropessoa" id="bairropessoa" value="${participante.bairroPessoa}"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-line row">
                                <div class="col-sm">
                                    <label>CEP</label>
                                    <input class="form-control" type="text" name="ceppessoa" id="ceppessoa" value="${participante.cepPessoa}" placeholder="00000-000" oninput="criaMascaraCEP()" maxLength="8"/>
                                </div>
                                <div class="col-sm">
                                    <label>Estado</label>
                                    <select class="form-control" name="idestado" id="idestado" onchange="BuscarCidadesPorEstado()" required>
                                        <option value="nulo">Selecione</option>
                                        <c:forEach var="estado" items="${estados}">
                                            <option value="${estado.idEstado}" ${participante.cidade.estado.idEstado == estado.idEstado ? "selected" : ""}>
                                                ${estado.nomeEstado}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-sm">
                                    <label>Cidade</label>
                                    <select class="form-control" name="idcidade" id="idcidade" required>
                                        <option value="nulo">Selecione</option>
                                        <c:forEach var="cidade" items="${cidades}">
                                            <option value="${cidade.idCidade}" ${participante.cidade.idCidade == cidade.idCidade ? "selected" : ""}>
                                                ${cidade.nomeCidade} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-line row">
                                <div class="col-sm">
                                    <label class="m-t-0 header-title">Data Nascimento/Funda��o</label>
                                    <input class="form-control" type="date" name="datanascfundpessoa" id="datanascfundpessoa" value="${participante.dataNascFundPessoa}"/>
                                </div>
                                <div class="col-sm">
                                    <label>Telefone</label>
                                    <input class="form-control" type="tel" name="telefonepessoa" id="telefonepessoa" value="${participante.telefonePessoa}" placeholder="(00) 00000-0000" oninput="criaMascaraTelefone()" maxLength="11"/>
                                </div>
                                <div class="col-sm">
                                    <label>E-mail</label>
                                    <input class="form-control" type="email" name="emailpessoa" id="emailpessoa" placeholder="exemplo@email.com" value="${participante.emailPessoa}"/>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-line row">
                                <div class="col-sm">
                                        <label>Sexo</label>
                                        <select class="form-control" name="sexoparticipante" id="sexoparticipante">
                                            <option value="N" ${participante.sexoParticipante == 'N' ? "selected" : ""}>Prefiro n�o dizer</option>  
                                            <option value="F" ${participante.sexoParticipante == 'F' ? "selected" : ""}>Feminino</option>
                                            <option value="M" ${participante.sexoParticipante == 'M' ? "selected" : ""}>Masculino</option>               
                                        </select>
                                    </div>  
                                <div class="col-sm">
                                    <label id="labellogin">Login</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="inputGroupPrepend2">@</span>
                                        </div>
                                        <input class="form-control" type="text" name="login" id="login" value="${participante.login}" size="20" maxlength="20" readonly="true" required/>
                                    </div>
                                </div>
                                <div class="col-sm">
                                    <label>Senha</label>
                                    <input class="form-control" type="password" name="senha" id="senha" value="${participante.senha}" size="20" maxlength="20" required/>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <a href="${pageContext.request.contextPath}/painel/home.jsp">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            </a>
                            <a href="#" onclick="validarCampos()">
                                <button type="button" class="btn btn-success">Salvar</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<style type="text/css">
    .inputfile{
        /* visibility: hidden etc. wont work */
        width: 0.1px;
        height: 0.1px;
        opacity: 0;
        overflow: hidden;
        position: absolute;
        z-index: -1;}
    .inputfile:focus + label{
        /* keyboard navigation */
        outline: 1px dotted #000;
        outline: -webkit-focus-ring-color auto 5px;}
    .inputfile + label * {
        pointer-events: none;}
    .borda{
        position: relative;
        margin: 0 20px 30px 0;
        padding: 10px;
        border: 1px solid #e1e1e1;
        border-radius: 3px;
        background: #fff;
        -webkit-box-shadow: 0px 0px 3px rgba(0,0,0,0.06);
        -moz-box-shadow: 0px 0px 3px rgba(0,0,0,0.06);
        box-shadow: 0px 0px 3px rgba(0,0,0,0.06);}
</style>

<script>

    function validarCampos() {
        console.log("entrei na valida��o de campos");

        url = "PessoaVerificarLogin?login=" + document.getElementById("login").value;
        $.getJSON(url, function (result) {
            console.log(result);
            if (document.getElementById("cpfcnpjpessoa").value == '') {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Verifique o CPF/CNPJ!',
                    showConfirmButton: true,
                    timer: 2000
                });
                $("#cpfcnpjpessoa").focus();
            } else if (document.getElementById('cpfcnpjpessoa').classList == "form-control is-invalid") {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Verifique o CPF/CNPJ!',
                    showConfirmButton: true,
                    timer: 2000
                });
                $("#cpfcnpjpessoa").focus();
            } else if (document.getElementById("nomerazaopessoa").value == '') {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Verifique o Nome!',
                    showConfirmButton: true,
                    timer: 2000
                });
                $("#nomerazaopessoa").focus();
            } else if (document.getElementById("idcidade").value == 'nulo') {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Verifique a Cidade!',
                    showConfirmButton: true,
                    timer: 2000
                });
                $("#idcidade").focus();
            } else if (document.getElementById("login").value == '') {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Verifique o Login!',
                    showConfirmButton: true,
                    timer: 2000
                });
                $("#login").focus();
            } else if ((result == 1) && (document.getElementById('login').readOnly == false)) {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Verifique o Login!',
                    showConfirmButton: true,
                    timer: 2000
                });
                $("#login").focus();
            } else if (document.getElementById("senha").value == '') {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Verifique a Senha!',
                    showConfirmButton: true,
                    timer: 2000
                });
                $("#senha").focus();
            } else if (document.getElementById("datanascfundpessoa").value == '') {
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: 'Verifique a Data de Nascimento/Funda��o!',
                    showConfirmButton: true,
                    timer: 2000
                });
                $("#datanascfundpessoa").focus();
            } else {
                gravarDados();
            }
        }).fail(function (obj, textStatus, error) {
            alert('Erro do servidor: ' + textStatus + ', ' + error);
        });
    }

    function gravarDados() {
        console.log("Gravando dados ....");
        let telefonepessoa = document.getElementById(`telefonepessoa`).value.replace(/([^0-9])+/g, "");
        let ceppessoa = document.getElementById(`ceppessoa`).value.replace(/([^0-9])+/g, "");

        $.ajax({
            type: 'post',
            url: 'ParticipanteCadastrar',
            data: {
                idparticipante: $('#idparticipante').val(),
                idpessoa: $('#idpessoa').val(),
                cpfcnpjpessoa: $('#cpfcnpjpessoa').unmask().val(),
                rgiepessoa: $('#rgiepessoa').val(),
                nomerazaopessoa: $('#nomerazaopessoa').val(),
                datanascfundpessoa: $('#datanascfundpessoa').val(),
                telefonepessoa: telefonepessoa,
                logradouropessoa: $('#logradouropessoa').val(),
                sexoparticipante: $('#sexoparticipante').val(),
                numlogradouropessoa: $('#numlogradouropessoa').val(),
                bairropessoa: $('#bairropessoa').val(),
                ceppessoa: ceppessoa,
                emailpessoa: $('#emailpessoa').val(),
                login: $("#login").val(),
                senha: $("#senha").val(),
                idcidade: $("#idcidade").val(),
                situacao: $("#situacao").val()
            },
            success:
                    function (data) {
                        console.log("reposta servlet->");
                        console.log(data);
                        if (data == 1) {
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Sucesso',
                                text: 'Participante gravado com sucesso!',
                                showConfirmButton: true,
                                timer: 10000
                            }).then(function () {
                                window.location.href = "${pageContext.request.contextPath}/ParticipanteLogadoCarregar?idParticipante=${sessionScope.idusuario}";
                            })
                        } else {
                            Swal.fire({
                                position: 'center',
                                icon: 'error',
                                title: 'Erro',
                                text: 'N�o foi poss�vel gravar o participante!',
                                showConfirmButton: true,
                                timer: 10000
                            }).then(function () {
                                window.location.href = "${pageContext.request.contextPath}/ParticipanteLogadoCarregar?idParticipante=${sessionScope.idusuario}";
                            })
                        }
                    },
            error:
                    function (data) {
                        window.location.href = "${pageContext.request.contextPath}/ParticipanteLogadoCarregar?idParticipante=${sessionScope.idusuario}";
                    }
        });
    }

    var cidade = ''; //variavel para controle do carregamento de cidades

    cidade = ${participante.cidade.idCidade};

    function BuscarCidadesPorEstado() {
        $('#idcidade').empty();
        idEst = $('#idestado').val();
        console.log("entrou buscar estado");
        if (idEst != 'null') {
            console.log("estado = " + idEst);
            url = "CidadeBuscarPorEstado?idestado=" + idEst;
            //console.log(url);
            $.getJSON(url, function (result) {
                //alert(result);
                $.each(result, function (index, value) {
                    $('#idcidade').append('<option id="cidade_' + value.idCidade + '"value="' + value.idCidade + '">' + value.nomeCidade + '</option>');
                    console.log(value.idCidade);
                    if (cidade !== '') {
                        $('#cidade_' + cidade).prop({selected: true});
                    } else {
                        $('#cidade_').prop({selected: true});
                    }
                });
            }).fail(function (obj, textStatus, error) {
                alert('Erro do servidor: ' + textStatus + ', ' + error);
            });
        }
    }

    function criaMascaraTelefone() {
        const maximoInput = document.getElementById(`telefonepessoa`).maxLength;
        let valorInput = document.getElementById(`telefonepessoa`).value;
        let valorSemPonto = document.getElementById(`telefonepessoa`).value.replace(/([^0-9])+/g, "");
        const mascaras = valorInput.replace(/[^\d]/g, "").replace(/^(\d{2})(\d{5})(\d{4})/, "($1) $2-$3");

        valorInput.length === maximoInput ? document.getElementById(`telefonepessoa`).value = mascaras
                : document.getElementById(`telefonepessoa`).value = valorSemPonto;
    }

    function criaMascaraCEP() {
        const maximoInput = document.getElementById(`ceppessoa`).maxLength;
        let valorInput = document.getElementById(`ceppessoa`).value;
        let valorSemPonto = document.getElementById(`ceppessoa`).value.replace(/([^0-9])+/g, "");
        const mascaras = valorInput.replace(/[^\d]/g, "").replace(/(\d{5})(\d{3})/, "$1-$2");

        valorInput.length === maximoInput ? document.getElementById(`ceppessoa`).value = mascaras
                : document.getElementById(`ceppessoa`).value = valorSemPonto;
    }

    function menuAtivo() {
        document.getElementById('titulopainel').innerHTML = "<strong>Cadastro do Participante</strong>";
    }

    $(document).ready(function () {
        menuAtivo();
        criaMascaraTelefone();
        criaMascaraCEP();
        trocaMascaraCpfCnpj($('#cpfcnpjpessoa').val());
        BuscarCidadesPorEstado();
    });

    //verificao do login
    $('#login').blur(function verificarLogin() {
        var login = $('#login').val();

        if (document.getElementById('login').readOnly == false) {

            if (login == '') {
                document.getElementById('labellogin').innerHTML = "<FONT COLOR='red'>Login inv�lido</FONT>";
                document.getElementById('login').classList.remove("is-valid");
                document.getElementById('login').classList.add("is-invalid");
            } else {
                var login = $('#login').val();
                console.log("entrou no verificar login: " + login);
                if (login != '') {
                    url = "PessoaVerificarLogin?login=" + login;
                    $.getJSON(url, function (result) {
                        console.log(result);
                        if (result == 1) {
                            document.getElementById('labellogin').innerHTML = "<FONT COLOR='red'>Login indispon�vel</FONT>";
                            document.getElementById('login').classList.remove("is-valid");
                            document.getElementById('login').classList.add("is-invalid");
                        } else if (result == 0) {
                            document.getElementById('labellogin').innerHTML = "<FONT COLOR='green'>Login dispon�vel</FONT>";
                            document.getElementById('login').classList.remove("is-invalid");
                            document.getElementById('login').classList.add("is-valid");
                        }
                    }).fail(function (obj, textStatus, error) {
                        alert('Erro do servidor: ' + textStatus + ', ' + error);
                    });
                }
            }
        }
    });

    function carregarPessoa(v) {
        //console.log("Entrou");
        var idM = v;
        var tipoPessoa = 'participante';
        //console.log("Usuario = " + idM);
        $(document).ready(function () {
            $.getJSON('PessoaBuscarCpfCnpj', {cpfcnpjpessoa: idM, tipopessoa: tipoPessoa}, function (respostaAdm) {
                console.log(respostaAdm);
                //var id = respostaAdm.idAdministrador;
                if (respostaAdm != null) {

                    if (respostaAdm.idParticipante == ${sessionScope.idusuario}) {
                        document.getElementById('labelcpfcnpj').innerHTML = "<FONT COLOR='green'>CPF/CNPJ v�lido</FONT>";
                        document.getElementById('cpfcnpjpessoa').classList.add("is-valid");
                        document.getElementById('cpfcnpjpessoa').classList.remove("is-invalid");
                    } else {
                        document.getElementById('labelcpfcnpj').innerHTML = "<FONT COLOR='red'>CPF/CNPJ indispon�vel</FONT>";
                        document.getElementById('cpfcnpjpessoa').classList.remove("is-valid");
                        document.getElementById('cpfcnpjpessoa').classList.add("is-invalid");
                    }
                } else {
                    //se n�o encontrou administrador busca por pessoa somente
                    tipoPessoa = 'pessoa';
                    $.getJSON('PessoaBuscarCpfCnpj', {cpfcnpjpessoa: idM, tipopessoa: tipoPessoa}, function (respostaPessoa) {
                        console.log(respostaPessoa);
                        var id = respostaPessoa.idPessoa;
                        if (id != "0")
                        {
                            document.getElementById('labelcpfcnpj').innerHTML = "<FONT COLOR='red'>CPF/CNPJ indispon�vel</FONT>";
                            document.getElementById('cpfcnpjpessoa').classList.remove("is-valid");
                            document.getElementById('cpfcnpjpessoa').classList.add("is-invalid");
                        } else {
                            document.getElementById('labelcpfcnpj').innerHTML = "<FONT COLOR='green'>CPF/CNPJ v�lido</FONT>";
                            document.getElementById('cpfcnpjpessoa').classList.add("is-valid");
                            document.getElementById('cpfcnpjpessoa').classList.remove("is-invalid");
                        }

                    });
                }

            });
        });
    }

</script>

<jsp:include page="/painel/footer.jsp"/>